#!/usr/bin/python3

import rw_emoncms as emoncms
import time
import os

emon = emoncms.EnergyMonitor()

WatchdogChecks = 10
OldStorageTemp = 0
OldElectricalPower = 0

while (WatchdogChecks > 0):
	try:
		StorageTemp = emon.readTopStorageTemp()
		ElectricalPower = emon.readTotalElectricalPower()
	except:
		StorageTemp = 0
		ElectricalPower = 0

	if (StorageTemp != OldStorageTemp) && (ElectricalPower != OldElectricalPower)):
		WatchdogChecks = -1
	else:
		WatchdogChecks = WatchdogChecks -1
		OldStorageTemp = StorageTemp
		OldElectricalPower = ElectricalPower
	time.sleep(100)

if (WatchdogChecks == -1):
	os.system('sudo reboot now')
