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
          #d=min(x[::len(x)-1], key=lambda x:abs(x - r))
          d=x[0]
          h = y[x.index(d)]
          z = (r - d) / (x[1] - x[0])
          l=self.lis(y)
          l.reverse()
          #if (r < d):
           #   for k in l:
           #       k.reverse()
            #      print(k)
          o=len(y)-1

          for i in l:
              for j in i:
                  h += self.fac(z,o-1) * j / (mt.factorial(o))
                  break
              o = o - 1
          return h



p=pop()
y=[2.8155,2.8182,2.8208,2.8234]
x=[654,658,662,666]
print(p.predict(670))
plt.xlabel("x axis")
plt.ylabel("y axis")
plt.plot(x,y)
plt.show()











