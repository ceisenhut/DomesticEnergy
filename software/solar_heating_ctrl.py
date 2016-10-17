#!/usr/bin/python3

import heating_ctrl_hw as hardware
import rw_emoncms as emoncms
import time

hw = hardware.CtrlHardware()
emon = emoncms.EnergyMonitor()

# hardware allocation:
def runSolarPump ():
    hw.changeOutput(pin=0, state=1)

def stopSolarPump ():
    hw.changeOutput(pin=0, state=0)

def runHeatingPump ():
    hw.changeOutput(pin=1, state=1)

def stopHeatingPump ():
    hw.changeOutput(pin=1, state=0)

def increaseHeatingTemp ():
    hw.changeOutput(pin=2, state=0)
    hw.changeOutput(pin=3, state=1)

def decreaseHeatingTemp ():
    hw.changeOutput(pin=2, state=1)
    hw.changeOutput(pin=3, state=0)

def freezeHeatingTemp ():
    hw.changeOutput(pin=2, state=0)
    hw.changeOutput(pin=3, state=0)

def changeToFullSolarHeatExchange ():
    hw.changeOutput(pin=4, state=0)
    hw.changeOutput(pin=5, state=1)

def changeToLowSolarHeatExchange ():
    hw.changeOutput(pin=4, state=1)
    hw.changeOutput(pin=5, state=0)

def freezeSolarHeatExchange ():
    hw.changeOutput(pin=4, state=0)
    hw.changeOutput(pin=5, state=0)

#========================================


SampleTime = 3

PostDataTime = 30

#state-indicators for solar-control:
SolarPumpRunning = False
SwitchOnTime = 0

#state-indicators for heating-control:
HeatingPumpRunning = False
HeatControlSampleTime = 300
HeatingState = 0     # heating off
DecreaseTempTime = 200
IncreaseTempTime = 0
ControlSampleTime = HeatControlSampleTime
ControlError = 0


#========================================
hw.initOutputs()

while True:
    T1 = hw.readTemp(0)
    T2 = hw.readTemp(1)
    T3 = hw.readTemp(2)
    T4 = hw.readTemp(3)
    T5 = hw.readTemp(4)
    T6 = hw.readTemp(5)
    T7 = hw.readTemp(6)
    T8 = hw.readTemp(7)

    ReadTime = 1.6 #0.2 seconds for each read
    # TODO: split sampling and reading

    TempLog = "T1:%2.1f,T2:%2.1f,T3:%2.1f,T4:%2.1f,T5:%2.1f,T6:%2.1f,T7:%2.1f,T8:%2.1f" % (
    T1, T2, T3, T4, T5, T6, T7, T8)

    # mean-temperature:
    StorageMeanTemp = (T1 * 25 + T2 * 25 + T3 * 25 + T4 * 25) / 100

    StorageMeanTempLog = "StorageMeanTemp:%2.1f" % (StorageMeanTemp)

    PostDataTime -= SampleTime
    if (PostDataTime<=0):
        PostDataTime = 30
        emon.postData(TempLog, 1)
        emon.postData(StorageMeanTempLog, 1)
    # postDataRemoteServer(TempLog,27)

    # ========================================
    # solar-control:
    # ========================================

    # if (StorageMeanTemp > 80):  # activ cooling
    #     SolarPumpRunning = True
    #     runSolarPump()
    #     SwitchOnTime = 0
    #     #print("solar-pump running (cooling/heating)")
    # else:
    #     if SolarPumpRunning:
    #         SwitchOnTime += SampleTime
    #         if (T9 > T8) and (SwitchOnTime > 300):
    #             SolarPumpRunning = False
    #             stopSolarPump()
    #             SwitchOnTime = 0
    #     elif (T7 > (T6 + 4)):
    #         SolarPumpRunning = True
    #         runSolarPump()

    #if (SolarPumpRunning):
        #print("solar-pump running")
    #else:
        #print("solar-pump idle")
    # ========================================
    # heating-control:
    # ========================================

    # HeatTempSetpoint = emon.readHeatingTempSetpoint()
    #
    # if (HeatingState == 0):  #heating off: setpoint = 0, temperature-mixer to lowest position
    #     HeatingPumpRunning = False
    #     if (DecreaseTempTime == 0):
    #         HeatingState = 1
    # elif (HeatingState == 1):  #heating idle: heating-system off, waiting for setpoint > 0
    #     HeatingPumpRunning = False
    #     if (HeatTempSetpoint > 0):
    #         HeatingState = 2
    #         ControlSampleTime = 0  # start control immediately
    # elif (HeatingState == 2): #heating-control: setpoint > 0, pump running, closed-loop temperature control
    #     HeatingPumpRunning = True
    #     ControlSampleTime -= SampleTime
    #     if (ControlSampleTime <= 0):
    #         ControlSampleTime = HeatControlSampleTime
    #         ControlError = HeatTempSetpoint - T10
    #         if (ControlError > 3):
    #             IncreaseTempTime = ControlError/3
    #         elif (ControlError < 3):
    #             DecreaseTempTime = -ControlError/2
    #     if (HeatTempSetpoint == 0):
    #         HeatingState = 0
    #         DecreaseTempTime = 200
    # else:
    #     HeatingPumpRunning = False
    #     DecreaseTempTime = 200
    #     HeatingState = 0
    #
    #
    # if (HeatingPumpRunning):
    #     runHeatingPump()
    # else:
    #     stopHeatingPump()
    #
    # if (DecreaseTempTime > 0):
    #     DecreaseTempTime -= SampleTime
    #     decreaseHeatingTemp()
    #     IncreaseTempTime = 0
    # elif (IncreaseTempTime > 0):
    #     IncreaseTempTime -= SampleTime
    #     increaseHeatingTemp()
    #     DecreaseTempTime = 0
    # else:
    #     freezeHeatingTemp()
    #     DecreaseTempTime = 0
    #     IncreaseTempTime = 0

    #print ("HeatingState = ", HeatingState)
    #print ("DecreaseTempTime = ", DecreaseTempTime)
    #print ("IncreaseTempTime = ", IncreaseTempTime)
    #print ("HeatControlError = ", ControlError)
    #print ("ControlSampleTime = ", ControlSampleTime)
    # ========================================
    if ((SampleTime-ReadTime)>0):
        time.sleep(SampleTime-ReadTime)   # TODO: split sampling and reading
    else:
        time.sleep(SampleTime)