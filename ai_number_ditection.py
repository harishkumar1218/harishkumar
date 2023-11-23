import torch as t
import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"
import numpy as np
import torchvision as tv
import matplotlib.pyplot as plt
from torchvision import transforms,datasets
import time as time
from torch import optim,nn

#dataseting
trainset=datasets.MNIST(root='./data',download=True,train=True,transform=transforms.Compose([transforms.ToTensor()]))
testset=datasets.MNIST(root="./data",download=True,train=False,transform=transforms.Compose([transforms.ToTensor()]))
valset,testset=t.utils.data.random_split(testset,[int(0.9*len(testset)),int(0.1*len(testset))])
trainset_dr=t.utils.data.DataLoader(trainset,batch_size=64,shuffle=True)
testset_dr=t.utils.data.DataLoader(testset,batch_size=32,shuffle=False)
valset_dr=t.utils.data.DataLoader(valset,batch_size=32,shuffle=False)

#ploting
fig=plt.figure(figsize=(7,5))
for i in range(5,6):
    img = transforms.ToPILImage(mode="L")(trainset[i][0])
    plt.title(trainset[i][1])
    plt.imshow(img)
plt.show()


#model class defing
class Modle(t.nn.Module):
    def __init__(self):
        super(Modle,self).__init__()
        self.conv1=t.nn.Conv2d(in_channels=1,out_channels=32,kernel_size=3,stride=1,padding=1)
        self.conv2=t.nn.Conv2d(in_channels=32,out_channels=64,kernel_size=3,stride=1,padding=1)
        self.maxpool=t.nn.MaxPool2d(kernel_size=2,stride=2)
        self.relu=t.nn.ReLU()
        self.liner1=t.nn.Linear(3136,128)
        self.liner2=t.nn.Linear(128,10)
        self.dopout=t.nn.Dropout(p=0.5)

    def forword(self,x):
        try:
          x=self.conv1(x)
          x=self.relu(x)
          x=self.maxpool(x)
          x=self.conv2(x)
          x=self.relu(x)
          x=self.maxpool(x)
          x=x.reshape(x.size(0),-1)
          x=self.liner1(x)
          x=self.relu(x)
          x=self.dopout(x)
          pred=self.liner2(x)

          return pred
        except ValueError:
            pass
#model object
model=Modle()
#cross entropy loss
corssentro=t.nn.CrossEntropyLoss()
#optimization
opti=t.optim.Adam(model.parameters(),lr=0.001)

#TRINING
no_epochs=50
train_loss=list()
val_loss=list()
best_val=1
loss=0.0
for epochs in range(no_epochs):
    total_train_loss = 0
    total_val_loss = 0
    model.train()
    for itr,(image,lable) in enumerate(trainset_dr):
         opti.zero_grad()
         try:
          pred =model.forword(image)
         except ValueError:
             pass

         loss=corssentro(pred,lable)
         total_train_loss+=loss.item()

         loss.backward()
         opti.step()
    total_train_loss=total_train_loss/(itr+1)
    train_loss.append(total_train_loss)

    model.eval()
    #evalvartion
    total=0
    for itr,(image,lable) in enumerate(valset_dr):
        try:
            pred=model.forword(image)
        except ValueError:
            print("hiii")
        loss=corssentro(pred,lable)
        total_val_loss+=loss.item()

        pred=t.softmax(pred,dim=1)
        for i,p in enumerate(pred):
            if lable[i]==t.max(p.data,0)[1]:
                total+=1
        accuracy=total/len(valset)

    total_val_loss=total_val_loss/(itr+1)
    val_loss.append(total_val_loss)
    print('\nepoch {}/{},trin loss: {:.8f},val loss: {:.8f},val_accuracy:{:.8f}'.format(epochs+1,no_epochs,total_train_loss,total_val_loss,accuracy))

    if total_val_loss<best_val:
        best_val=total_val_loss
        t.save(model.state_dict(),"model.dth")
try:
 fig=plt.figure(figsize=(20,10))
 plt.plot(np.arange(1,no_epochs+1),train_loss)
 plt.plot(np.arange(1,no_epochs+1),val_loss)
 plt.xlabel("epochs")
 plt.ylabel("loss")
 plt.title("Loss Plots")
 # plt.show()
except ValueError:
    pass

model.load_state_dict(t.load("model.dth"))
model.eval()
result=list()

total=0
for itr,(image,lable) in enumerate(testset_dr):
    try:
        pred=model.forword(image)
    except ValueError:
        print("byee")
    pred=t.softmax(pred,dim=1)

    for i,p in enumerate(pred):
        if lable[i]==t.max(p.data,0)[1]:
            total+=1
            result.append((image,t.max(p.data,0)[1]))
testaccurasy=total/(itr+1)
print("test accuracy {:.8f}".format(testaccurasy))

fig=plt.figure(figsize=(20,10))
for i in range(1,11):
       img=transforms.ToPILImage(mode="L")(result[i][0][1])
       fig.add_subplot(2,5,i)
       plt.title(result[i][1].item())
       plt.imshow(img)
plt.show()
