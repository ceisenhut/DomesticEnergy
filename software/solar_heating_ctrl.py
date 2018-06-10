#!/usr/bin/python3

import heating_ctrl_hw as hardware
import rw_emoncms as emoncms
import time
import os
import sys


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

def setValves4TemperatureShifting ():
    hw.changeOutput(pin=0, state=1)
    hw.changeOutput(pin=1, state=1)
    hw.changeOutput(pin=2, state=1)
    hw.changeOutput(pin=3, state=1)
    hw.changeOutput(pin=4, state=1)
    hw.changeOutput(pin=5, state=1)

def setValves4TemperatureShiftingIdle ():
    hw.changeOutput(pin=0, state=0)
    hw.changeOutput(pin=1, state=1)
    hw.changeOutput(pin=2, state=1)
    hw.changeOutput(pin=3, state=1)
    hw.changeOutput(pin=4, state=1)
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
State_SetValves4TemperatureShifting = 8
State_TemperatureShifting = 9
State_TemperatureShiftingIdle = 10

Charging_State = State_SetValves4Idle
StateCtrlTimeout = 30
ChargeIntegral = 0

T3_entry = 0
T2_entry = 0

PWM_PinElectricHeating = 37
PWM_Frequency = 1000
ActualDutyCycle = 0
GridPowerMonitor = 0
GridPowerWatchdog = 0

add_storage_en = False   # additional heat storage enable/disable

Pulse1_Pin = 29
Pulse2_Pin = 31

Pulse1 = 0
Pulse2 = 0

Millisec1 = 0
Millisec2 = 0
Power1 = 0
Power2 = 0

def PulseInterrupt1(n):
    global Pulse1
    global Millisec1
    global Power1
    Pulse1 = Pulse1 + 1
    millis = int(round(time.time() * 1000))
    DeltaTime = millis - Millisec1
    Millisec1 = millis
    Power1 = 3600000/DeltaTime    # 1pulse = 1Wh = 3600Ws

def PulseInterrupt2 (n):
    global Pulse2
    global Millisec2
    global Power2
    Pulse2 = Pulse2 + 1
    millis = int(round(time.time() * 1000))
    DeltaTime = millis - Millisec2
    Millisec2 = millis
    Power2 = 3600000/DeltaTime    # 1pulse = 1Wh = 3600Ws

#========================================
try:
    hw.initOutputs()
    setValves4Idle()
    time.sleep(45)
    hw.initOutputs()

    Millisec1 = int(round(time.time() * 1000))
    Millisec2 = Millisec1

    ElectricHeatPWM = hw.initPWM(PWM_PinElectricHeating, PWM_Frequency)

    hw.initEventDetect(Pulse1_Pin, PulseInterrupt1)
    hw.initEventDetect(Pulse2_Pin, PulseInterrupt2)

    while True:
        T1 = hw.readTemp(0)
        T2 = hw.readTemp(1)
        T3 = hw.readTemp(2)
        T4 = hw.readTemp(3)
        T5 = hw.readTemp(4)  # used for additional storage switch
        T6 = hw.readTemp(5)  # not used already
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

        Pulse_Count_Log = "Pulse1:%2.1f,Pulse2:%2.1f" % (Pulse1, Pulse2)

        Electric_Power_Log = "Power1:%2.1f,Power2:%2.1f" % (Power1, Power2)

        PostDataTime -= SampleTime

        if (T5 < 0):   # read additional storage-enable switch (connected at T5)
            add_storage_en = True
        else:
            add_storage_en = False

        if (PostDataTime<=0):
            PostDataTime = 30

            # ===========================================
            # Control of electrical heating
            # ===========================================
            #ActualGridPower = emon.readTotalElectricalPower()
            ActualGridPower = Power1 - Power2
            ActualDutyCycle = ActualDutyCycle - (ActualGridPower / 50)

            if (ActualDutyCycle > 100):
                ActualDutyCycle = 100
            elif (ActualDutyCycle < 0):
                ActualDutyCycle = 0

            if (T1 > 85):
                ActualDutyCycle = 0

            #ActualDutyCycle = 0  # todo: remove, if heating duty-cycle activated
            
            # if add_storage_en:
            #     ActualDutyCycle = 0
            # else:
            #     ActualDutyCycle = 100

            hw.setPWM(ElectricHeatPWM, ActualDutyCycle)

            ElectricalHeatingDutyCycleLog = "DutyCycleElectricHeating:%2.1f" % (ActualDutyCycle)

            # ===========================
            # Watchdog for grid-power
            # ===========================
            if (ActualGridPower != GridPowerMonitor):
                GridPowerMonitor = ActualGridPower
                GridPowerWatchdog = 0
            else:
                GridPowerWatchdog = GridPowerWatchdog + 1

            if (GridPowerWatchdog > 20):
                #os.system("reboot")
                #sys.exit()
                GridPowerWatchdog = 0  #todo: eliminate grid-power-watchdog?
            GridPowerWatchdogLog = "GridPowerWatchdog:%2.1f" % (GridPowerWatchdog)
            # ===========================
            # Logging
            # ===========================
            try:
                emon.postData(TempLog, 1)
                emon.postData(StorageMeanTempLog, 1)
                emon.postData(Charging_State_Log, 1)
                emon.postData(ElectricalHeatingDutyCycleLog, 1)
                emon.postData(GridPowerWatchdogLog, 1)
                emon.postData(Pulse_Count_Log, 1)
                emon.postData(Electric_Power_Log, 1)
            except:
                print("local-server not accessible")
            # try:
            #     emon.postDataRemoteServer(TempLog, 1)
            #     emon.postDataRemoteServer(Charging_State_Log, 1)
            #     emon.postDataRemoteServer(ElectricalHeatingDutyCycleLog, 1)
            #     emon.postDataRemoteServer(GridPowerWatchdogLog, 1)
            # except:
            #     print("remote-server not accessible")


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
                if ((T2 > 65) and add_storage_en):
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                if (T1 > 76):
                    Charging_State = State_SetValves4TemperatureShifting
                    setValves4TemperatureShifting()
                if (T8 > T2):
                    Charging_State = State_SetValves4Discharging
                    setValves4Discharging()
                StateCtrlTimeout = 45
            elif (Charging_State == State_SetValves4Charging):
                Charging_State = State_Charging
                hw.initOutputs()
                runChargePump()
                StateCtrlTimeout = 30
            elif (Charging_State == State_Charging):
                StateCtrlTimeout = 30
                if (T2 < 60):
                    Charging_State = State_ChargingIdle
                    stopChargePump()
                if (T2 > 72):  # if T2 exceeds 72 degrees, valves may not be set correctly for charging
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                    StateCtrlTimeout = 45
                # if (T1 > 76):
                #     Charging_State = State_SetValves4TemperatureShifting
                #     setValves4TemperatureShifting()
                #     stopChargePump()
                #     StateCtrlTimeout = 45
            elif (Charging_State == State_ChargingIdle):
                if (T2 > 65):
                    Charging_State = State_Charging
                    runChargePump()
                if (T2 < 45):
                    Charging_State = State_SetValves4Discharging
                    setValves4Discharging()
                if (T2 > 72):  # if T2 exceeds 72 degrees, valves may not be set correctly for charging
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                # if (T1 > 76):
                #     Charging_State = State_SetValves4TemperatureShifting
                #     setValves4TemperatureShifting()
                #     stopChargePump()
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
                if (T2 > 65):
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                    stopChargePump()
                if (T2 < 23):
                    Charging_State = State_SetValves4Idle
                    setValves4Idle()
                    stopChargePump()
                if (T1 > 76):
                    Charging_State = State_SetValves4TemperatureShifting
                    setValves4TemperatureShifting()
                    stopChargePump()
                StateCtrlTimeout = 60
            elif (Charging_State == State_DischargingIdle):
                if (T2<(T2_entry -5)):
                    Charging_State = State_Discharging
                    runChargePump()
                    T3_entry = T3
                if (T2 < 23):
                    Charging_State = State_SetValves4Idle
                    setValves4Idle()
                if (T2 > 65):
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                if (T1 > 76):
                    Charging_State = State_SetValves4TemperatureShifting
                    setValves4TemperatureShifting()
                    stopChargePump()
                StateCtrlTimeout = 60
            elif (Charging_State == State_SetValves4TemperatureShifting):
                Charging_State = State_TemperatureShifting
                hw.initOutputs()
                runChargePump()
                StateCtrlTimeout = 30
            elif (Charging_State == State_TemperatureShifting):
                if ((T1 < 72) or (T2 > 70)):
                    Charging_State = State_TemperatureShiftingIdle
                    stopChargePump()
                    setValves4TemperatureShiftingIdle()
                if ((T2 > 65) and add_storage_en):
                    Charging_State = State_SetValves4Charging
                    stopChargePump()
                StateCtrlTimeout = 45
            elif (Charging_State == State_TemperatureShiftingIdle):
                hw.initOutputs()
                if ((T1 > 76) and (T2 < 70)):
                    Charging_State = State_SetValves4TemperatureShifting
                    setValves4TemperatureShifting()
                if ((T2 > 65) and add_storage_en):
                    Charging_State = State_SetValves4Charging
                    setValves4Charging()
                if ((T2 < 30) and (T8 < T2)):
                    Charging_State = State_SetValves4Idle
                    setValves4Idle()
                if ((T2 < 30) and (T8 >= T2)):
                    Charging_State = State_SetValves4Discharging
                    setValves4Discharging()
                StateCtrlTimeout = 45
            else:
                setValves4Idle()
                Charging_State = State_SetValves4Idle
                StateCtrlTimeout = 45

        StateCtrlTimeout -= SampleTime


        # ========================================
        if ((SampleTime-ReadTime)>0):
            time.sleep(SampleTime-ReadTime)   # TODO: split sampling and reading
        else:
            time.sleep(SampleTime)

finally:
    hw.cleanupGPIO()
