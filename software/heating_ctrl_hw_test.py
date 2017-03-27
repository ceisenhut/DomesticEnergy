#!/usr/bin/python3

try:
    import sys
    from heating_ctrl_hw import *
    import time

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

    ElectricHeatPWM = hw.initPWM(36, 1000)
    hw.setPWM(ElectricHeatPWM, DutyCycle)

    while True:
        time.sleep(1)

finally:
    hw.stopPWM(ElectricHeatPWM)
    hw.cleanupGPIO()