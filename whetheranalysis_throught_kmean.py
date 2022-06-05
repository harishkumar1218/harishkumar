#importing libs
import numpy as np
import matplotlib.pyplot as plt
import math as mt
import random
import pandas as pd
#dataset
dataset = pd.read_csv('minute_weather.csv')  
samp = dataset[(dataset['rowID'] % 1) == 0] #whether details
x=np.array(samp['air_temp'][:300]) #temp
y=np.array(samp['relative_humidity'][:300]) #humidity

#geting array values
def val(arr,j):
  return [arr[:][i][j] for i in range(len(arr))]
#kmean function 
def kmean(x,y,n):
  a=0
  centroids=[]
  groups=[]
  for i in range(n):
    centroids.append([round(random.uniform(min(x),max(x)),1),round(random.uniform(min(y),max(y)),1)])
  while True:
    new_centroids=[]
    for i in range(n):
      groups.append([]) #number of clusters
    for i,j in zip(x,y):
      dis=[]
      for u,v in zip(val(centroids,0),val(centroids,1)):
        d=mt.sqrt((i-u)**2+(j-v)**2)
        dis.append(d)
      groups[dis.index(min(dis))].append([i,j])
    for i in range(n):
      new_centroids.append([round(sum(val(groups[i],0))/len(val(groups[i],0)),2),round(sum(val(groups[i],1))/len(val(groups[i],1)),2)])
    print(centroids)
    print(new_centroids)
    if new_centroids==centroids:
      break
    centroids=new_centroids
    a+=1
    print(a)
  plt.scatter(val(centroids,0),val(centroids,1),c='grey')
  plt.scatter(val(groups[0],0),val(groups[0],1),c='red')
  plt.scatter(val(groups[1],0),val(groups[1],1),c='blue')
  plt.scatter(val(groups[2],0),val(groups[2],1),c='green')
  plt.scatter(val(groups[3],0),val(groups[3],1),c='yellow')
#here 4 is k value we have to find it by wcss but we commonly taken as 4
kmean(x,y,4)


