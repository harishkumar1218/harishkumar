import math as mt
import matplotlib as plt


class pre:
    def __init__(self,x,y):
        self.x=x
        self.y=y
    def predict(self,p):
        t=0
        x=self.x
        y=self.y
        for i,j in zip(x,y):
            a=1
            for k in x:
                if (k != i):
                    a*=(p-k)/(i-k)
            t+=a*j
        return t
  
p=prediction
x = [0, 1, 3, 4, 7]
y = [1, 3, 49, 129, 813]
p.pre(x,y).predict(0.5)
plt.plot(x,y)
plt.ylabel("y axis")
plt.xlabel("x axis")
plt.show()

