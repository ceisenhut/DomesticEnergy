#!/usr/bin/python3

import heating_ctrl_hw as hardware
import rw_emoncms as emoncms
import time

hw = hardware.CtrlHardware()
emon = emoncms.EnergyMonitor()

# hardware allocation:
def runChargePump ():
    hw.changeOutput(pin=6, state=1)

def stopChargePump ():
    hw.changeOutput(pin=6, state=0)

def setValves4Idle ():
    hw.changeOutput(pin=0, state=0)
    hw.changeOutput(pin=1, state=1)
    hw.changeOutput(pin=2, state=0)
    hw.changeOutput(pin=3, state=1)
    hw.changeOutput(pin=4, state=1)
    hw.changeOutput(pin=5, state=1)

def setValves4Charging ():
    hw.changeOutput(pin=0, state=1)
    hw.changeOutput(pin=1, state=1)
    hw.changeOutput(pin=2, state=0)
    hw.changeOutput(pin=3, state=1)
    hw.changeOutput(pin=4, state=1)
    hw.changeOutput(pin=5, state=1)

def setValves4Discharging ():
    hw.changeOutput(pin=0, state=0)
    hw.changeOutput(pin=1, state=1)
    hw.changeOutput(pin=2, state=0)
    hw.changeOutput(pin=3, state=1)
    hw.changeOutput(pin=4, state=0)
    hw.changeOutput(pin=5, state=1)

#========================================


SampleTime = 3
PostDataTime = 30


#states for charge-control
State_SetValves4Idle = 0
State_Idle = 1
State_SetValves4Charging = 2
State_Charging = 3
State_ChargingIdle = 4
State_SetValves4Discharging = 5
State_Discharging = 6
State_DischargingIdle = 7

Charging_State = State_SetValves4Idle
StateCtrlTimeout = 30
ChargeIntegral = 0

T3_entry = 0
T2_entry = 0

#========================================
hw.initOutputs()
setValves4Idle()


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

    Charging_State_Log = "ChargingState:%2.1f" % (Charging_State)

    PostDataTime -= SampleTime
    if (PostDataTime<=0):
        PostDataTime = 30
        emon.postData(TempLog, 1)
        emon.postData(StorageMeanTempLog, 1)
        emon.postData(Charging_State_Log, 1)

    # ========================================
    # charging-control:
    # ========================================
    if (StateCtrlTimeout <= 0):
        if (Charging_State == State_SetValves4Idle):
            Charging_State = State_Idle
            ChargeIntegral = 0
            hw.initOutputs()
            StateCtrlTimeout = 30
        elif (Charging_State == State_Idle):
            if (T2 > 65):
                Charging_State = State_SetValves4Charging
                setValves4Charging()
            StateCtrlTimeout = 45
        elif (Charging_State == State_SetValves4Charging):
            Charging_State = State_Charging
            hw.initOutputs()
            runChargePump()
            StateCtrlTimeout = 30
        elif (Charging_State == State_Charging):
            if (T2 < 60):
                Charging_State = State_ChargingIdle
                stopChargePump()
            StateCtrlTimeout = 30
        elif (Charging_State == State_ChargingIdle):
            if (T2 > 65):
                Charging_State = State_Charging
                runChargePump()
            if (T2 < 45):
                Charging_State = State_SetValves4Discharging
                setValves4Discharging()
            StateCtrlTimeout = 45
        elif (Charging_State == State_SetValves4Discharging):
            Charging_State = State_Discharging
            hw.initOutputs()
            runChargePump()
            StateCtrlTimeout = 60
            T3_entry = T3
        elif (Charging_State == State_Discharging):
            if ((T3>(T3_entry+2)) or (T7 < (T2+2))):
                Charging_State = State_DischargingIdle
                stopChargePump()
                T2_entry = T2
            StateCtrlTimeout = 60
        elif (Charging_State == State_DischargingIdle):
            if (T2<(T2_entry -5)):
                Charging_State = State_Discharging
                runChargePump()
                T3_entry = T3
            if (T2 < 22):
                Charging_State = State_SetValves4Idle
                setValves4Idle()
            StateCtrlTimeout = 60
        else:
            hw.initOutputs()
            setValves4Idle()
            Charging_State = State_Idle
            StateCtrlTimeout = 45

    StateCtrlTimeout -= SampleTime

    # ========================================
    if ((SampleTime-ReadTime)>0):
        time.sleep(SampleTime-ReadTime)   # TODO: split sampling and reading
    else:
        time.sleep(SampleTime)