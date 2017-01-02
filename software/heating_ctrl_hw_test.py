#!/usr/bin/python3

try:
	import sys
	from heating_ctrl_hw import *
	from time import *

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

	hw.initPWM(16)
	hw.setPWM(16, 1000, DutyCycle)
	while True:
		sleep(1)

except KeyboardInterrupt:
	hw.cleanupGPIO()
