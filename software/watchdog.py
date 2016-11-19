#!/usr/bin/python3

import rw_emoncms as emoncms
import time
import os

emon = emoncms.EnergyMonitor()

StorageTemp = emon.readTopStorageTemp()
ElectricalPower = emon.readTotalElectricalPower()

print(StorageTemp)
print(ElectricalPower)

os.system('sudo reboot now')
