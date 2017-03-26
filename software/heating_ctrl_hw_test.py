#!/usr/bin/python3

import sys
from heating_ctrl_hw import *

hw = CtrlHardware()

try:
    DutyCycle = (int) (sys.argv[1])
except:
    DutyCycle = 0

if (DutyCycle <= 100 and DutyCycle >= 0):
    print (DutyCycle)
else:
    print ('else-path')
    DutyCycle = 0


#hw.initOutputs()
#hw.changeOutput(pin=6, state=1)
#hw.changeOutput(pin=5, state=1)
#hw.setOutput(0x80)

ElectricHeatPWM = hw.initPWM(36, 1000)
hw.setPWM(ElectricHeatPWM, DutyCycle)

try:
    while True:
        time.sleep(1)

finally:
    hw.stopPWM(ElectricHeatPWM)