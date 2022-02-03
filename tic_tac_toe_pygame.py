import pygame as pg
import os,sys
import numpy as np
green=(50,200,20)
pg.init()
W=600;H=620
screen=pg.display.set_mode((W,H))
pg.display.set_caption('tic tac to')


def bord():
    screen.fill(color=(25,25,25))
    pg.draw.line(screen,(1,1,1),(0,200),(600,200),15)
    pg.draw.line(screen,(1,1,1),(0,400),(600,400),15)
    pg.draw.line(screen,(1,1,1),(200,0),(200,600),15)
    pg.draw.line(screen,(1,1,1),(400,0),(400,600),15)

cross= [ [[[(20,20),(180,180)],[(180,20),(20,180)]]    ,  [[(220,20),(380,180)],[(380,20),(220,180)]]    , [[(420,20),(580,180)],[(580,20),(420,180)]]],
         [[[(20,220),(180,380)],[(180,220),(20,380)]]  ,  [[(220,220),(380,380)],[(380,220),(220,380)]]  ,  [[(420,220),(580,380)],[(580,220),(420,380)]]],
         [[[(20,420),(180,580)],[(180,420),(20,580)]]  ,  [[(220,420),(380,580)],[(380,420),(220,580)]]  ,  [[(420,420),(580,580)],[(580,420),(420,580)]]] ]
circe= [[[(100,100)],[(300,100)],[(500,100)]],
        [[(100,300)],[(300,300)],[(500,300)]],
        [[(100,500)],[(300,500)],[(500,500)]] ]
col=   [[(100,20),(100,580)],[(300,20),(300,580)],[(500,20),(500,580)] ]
row=   [[(20,100),(580,100)],[(20,300),(580,300)],[(20,500),(580,500)]]
fline= [(580,20),(20,580)]
bline= [(20,20),(580,580)]

b =np.zeros((3,3),dtype=int)
#functions
def mark(r,c,p):
    b[r][c]=p
    
def isavb(r,c):
    return b[r][c]==0

def isfull():
    j=0
    for r in range(3):
        for c in range(3):
            if b[r][c]==0:
                j+=1
    if j==0:return True
    else:return False

def colwin(c,p):
    if p==1:
        pg.draw.line(screen,green,col[c][0],col[c][1],15)
    elif p==2:
        pg.draw.line(screen, green, col[c][0], col[c][1],15)
def rowwin(r,p):
    if p==1:
        pg.draw.line(screen,green,row[r][0],row[r][1],15)
    elif p==2:
        pg.draw.line(screen, green, row[r][0], row[r][1],15)
def fos(p):
    if p==1:
        pg.draw.line(screen,green,fline[0],fline[1],15)
    elif p==2:
        pg.draw.line(screen, green,fline[0],fline[1],15)
def bos(p):
    if p==1:
        pg.draw.line(screen,green,bline[0],bline[1],15)
    elif p==2:
        pg.draw.line(screen, green,bline[0],bline[1],15)

def reset():
    bord()
    for i in range(3):
        for j in range(3):
            b[i][j]=0

def win(ply):
    #col
    for c in range(3):
        if b[0][c]==ply and b[1][c]==ply and b[2][c]==ply:
            colwin(c,ply)
            return True
    #row
    for r in range(3):
        if b[r][0]==ply and b[r][1]==ply and b[r][2]==ply:
            rowwin(r,ply)
            return True
    #forward
    if b[2][0]==ply and b[1][1]==ply and b[0][2]==ply:
        fos(ply)
        return True
    if b[0][0]==ply and b[1][1]==ply and b[2][2]==ply:
        bos(ply)
        return True
    return False
  #game start
drw='***DRAW*** PRESS Q'
player1="winner is ***"+str(input("enter first player name "))+"***"
player2="winner is ***"+str(input("enter second player name "))+"***"
font=pg.font.Font(pg.font.get_default_font(),20)
player1=font.render(player1,True,(0,255, 255),)
player2=font.render(player2,True,(200, 200, 0))
drw=font.render(drw,True,(250,0,0))
bord()
player=1
while True:
    for event in pg.event.get():
        if event.type==pg.QUIT:
            sys.exit()
            
        if event.type==pg.MOUSEBUTTONDOWN and win(player)==False:
            mousx=event.pos[0]
            mousy=event.pos[1]
            click_x=int(mousy//200)
            click_y=int(mousx//200)
            print(mousx, mousy)
            print(circe[click_x][click_y][0])
            
            if player==1:
                if isavb(click_x,click_y):
                    pg.draw.line(screen, (0,255, 255), cross[click_x][click_y][0][0],cross[click_x][click_y][0][1], 15)
                    pg.draw.line(screen, (0,255, 255), cross[click_x][click_y][1][0],cross[click_x][click_y][1][1], 15)
                    mark(click_x,click_y,1)
                    win(player)
                    if win(player)==True:
                        screen.blit(player1,(200,600))
                        break
                    player=2
                else:pass
                
                
            elif player==2:
                if isavb(click_x,click_y):
                    pg.draw.circle(screen, (200, 200, 0),circe[click_x][click_y][0], 70, 15)
                    mark(click_x,click_y,2)
                    win(player)
                    if win(player) == True:
                        screen.blit(player2, (200, 600))
                        break
                    player=1
                else:pass
                
            if isfull()==True and win(player)==False:
                screen.blit(drw,(200,600))
            print(b)
            
        if event.type==pg.KEYDOWN:
            if event.key==pg.K_q:
              reset()
    pg.display.update()
