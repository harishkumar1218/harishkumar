from asyncio import sleep
from concurrent.futures import thread
from importlib.resources import path
import time
from tkinter import E
from typing_extensions import Type
import pyautogui,os
from pywinauto.application import Application as ap
import datetime as dt


def executed(id,psw):
    ap().start(cmd_line="C:\\Users\\sathish C\\AppData\\Roaming\\Zoom\\bin\\Zoom.exe")
    pyautogui.getWindowsWithTitle('Zoom')[0].maximize()
    time.sleep(2)
    pyautogui.click(x=783,y=470)
    time.sleep(4)
    pyautogui.typewrite(id)
    time.sleep(4)
    pyautogui.press('enter')
    time.sleep(6)
    pyautogui.typewrite(psw)
    time.sleep(5)
    pyautogui.press('enter')
    time.sleep(45)
    pyautogui.click(x=1074,y=713)

def exit():
    pyautogui.hotkey('alt','q')
    time.sleep(2)
    pyautogui.press('enter')

def waiting(d,h,m):
    b=dt.datetime.now()
    a=[dt.datetime.strptime( '10:45:00','%H:%M:%S'),dt.datetime.strptime('11:46:00','%H:%M:%S'),dt.datetime.strptime('12:45:00','%H:%M:%S'),
        dt.datetime.strptime('14:00:00',"%H:%M:%S"),dt.datetime.strptime('15:00:00',"%H:%M:%S"),dt.datetime.strptime('16:0:0','%H:%M:%S')]
    if(((h==9 and m>=45) or (h==10 and m<45))and d!=3):
        time.sleep((a[0]-b).seconds)
    elif(((h==9 and m>=45) or (h==10 and m<45))and d==3):
        time.sleep(3600)
    elif(((h==10 and m>=45) or (h==11 and m<45)) and d!=3):
        time.sleep((a[1]-b).seconds)
        print((a[1]-b).seconds)
    elif(((h==11 and m>=45) or (h==12 and m<45))and d!=3):
        time.sleep((a[2]-b).seconds)
    elif(((h==12 and m>=45) or (h==13 and m<59))):
        time.sleep((a[3]-b).seconds)
    elif(h==14):
        time.sleep((a[4]-b).seconds)
    elif(h==15 and (d==2 or d==3 )):
        

        time.sleep((a[4]-b).seconds)
    elif(h==16 and (d==2 or d==3)):
        time.sleep((a[5]-b).seconds)
            
            
       

id={'ds':'7582346106','co':'9200426946','dt':'9520957899','dm':'5724753431','ns':'4563768911','cp':'6886246049','pp':'5013573949'}
psw={'ds':'5197148','co':'51121','dt':'094577','dm':'960677','ns':'805299','cp':'8d4MKG','pp':'1VEvnc'}
table=[ ['ds','co','dt','ds'],
        ['pp','dt','pp','cp'],
        ['co','ns','cp','pp','dm','ds'],
        ['pp','co','ds','ns'],
        ['ns','dm','pp','wc'] ]


a=dt.datetime.now()
if(a.hour<=9):
    time.sleep(dt.timedelta(hours=9-a.hour,minutes=43-a.minute,seconds=59-a.second).seconds) 
for i in table[a.weekday()]:
    executed(id[i],psw[i])     
    waiting(a.weekday,a.hour,a.minute) 
    exit()
    




    