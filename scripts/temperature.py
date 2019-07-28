#!/usr/bin/python2.7
import os, time
from sys import *

repeat = False
data = ""
i = 1

if len(argv) > 1:
        if argv[1] == 'repeat' or argv[1] == 'r' or argv[1] == '-repeat' or argv[1] == '-r':
                repeat = True

temp = 'cat /sys/class/thermal/thermal_zone11/temp'
temp = os.popen(temp).readline().strip()
temp = int(temp) / 1000
ctime = time.strftime('%r - %A, %h %d - %m/%d/%Y')
print('TIME: ' + ctime)
print('CPU TEMP: ' + str(temp) + ' C')
data = 'CPU TEMP: ' + str(temp) + ' C\n'

while repeat:
        os.system('clear')
        temp = 'cat /sys/class/thermal/thermal_zone11/temp'
        temp = os.popen(temp).readline().strip()
        temp = int(temp) / 1000
        ctime = time.strftime('%r - %A, %h %d - %m/%d/%Y')
        print('===RECORD===\n' + data + '\n\n')
        print('TIME: ' + ctime)
        print('CPU TEMP: ' + str(temp) + ' C')
        if i >= 10:
                data += 'TIME: ' + ctime + '\n'
                i = 0
        data += 'CPU TEMP: ' + str(temp) + ' C\n'
        time.sleep(1)
