import matplotlib.pyplot as plt
import math as mt
t=[]
class pop:
      def __init__(self):
        self.x=[]
        self.y=[]
        self.t=[]

      def lis(self,z):
              d = [j - i for i,j in zip(z,z[1:])]
              t.append(d)
              if len(d)==1:
                 return t
              return self.lis(d)

      def fac(self,p,j):
          i=j
          d=1
          while(i>=0):
              d*=p-i
              i-=1
          return d

      def predict(self,r):
          d=x[0]
          h = y[x.index(d)]
          z = (r - d) / (x[1] - x[0])
          l=self.lis(y)
          l.reverse()
          o=len(y)-1
          for i in l:
              for j in i:
                  h += self.fac(z,o-1) * j / (mt.factorial(o))
                  break
              o = o - 1
          return h
p=pop()
x=[1891,1901,1911,1921,1931]
y=[46,66,81,93,101]
print(p.predict(670))
plt.xlabel("x axis")
plt.ylabel("y axis")
plt.plot(x,y)
plt.show()











