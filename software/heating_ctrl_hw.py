#!/usr/bin/python3

import os
import subprocess
import smbus
import spidev
import time
import RPi.GPIO as gpio

#import configparser

#config = configparser.ConfigParser()
#try:
#	config.read('/home/pi/Documents/config.txt')
#except:
#	print("configuration-file not found!\n")

adc_0degrees = 213
adc_100degrees = 645


class CtrlHardware():
	_output = 0xff
	spi = spidev.SpiDev()
	spi.open(0, 0)


	#sensor_id: 0..15
	def readTemp (self, sensor_id):
		bus = smbus.SMBus(1)
		if sensor_id >= 0 and sensor_id < 8:
			#set output-latch of GPB3 low
			bus.write_byte_data(0x20, 0x15, sensor_id)
		#set pins 0..3 of register B as output
		bus.write_byte_data(0x20, 0x01, 0xF0)
		time.sleep (0.2)
		adc_result = self.spi.xfer([0x01, 0x80, 0x00])
		value = 256*adc_result[1] + adc_result[2]
		Temp = 100.0*(value - adc_0degrees)/(adc_100degrees - adc_0degrees)
		return Temp

	def initOutputs (self):
		bus = smbus.SMBus(1)
		self._output = 0x00
		bus.write_byte_data(0x20, 0x14, 0x00)
		bus.write_byte_data(0x20, 0x00, 0x00)

	def setOutput (self, output):
		bus = smbus.SMBus(1)
		self._output = (~output + 256)
		bus.write_byte_data(0x20, 0x14, self._output)
		bus.write_byte_data(0x20, 0x00, 0x00)

	def changeOutput (self, pin=0, state=0):
		"""
		changes output of specific pin

		state=0: output inactiv
		state=1: output activ
		"""
		bus = smbus.SMBus(1)
		if (state == 1):
			self._output = self._output | (2**pin)
		else:
			self._output = self._output & ((~(2**pin))+ 256)
		bus.write_byte_data(0x20, 0x14, self._output)
		bus.write_byte_data(0x20, 0x00, 0x00)

	def initPWM (self, pin, freq):
		gpio.setmode(gpio.BOARD)
		gpio.setup(pin, gpio.OUT)
		pwm = gpio.PWM(pin, freq)
		return pwm

	def setPWM (self, PWM, duty):
		PWM.start(duty)

	def stopPWM (self, PWM):
		PWM.stop()

	def cleanupGPIO (self):
		gpio.cleanup()

	def initEventDetect (self, pin, callback_function):
		gpio.setmode(gpio.BOARD)
		#gpio.setup(pin, gpio.IN, pull_up_down=gpio.PUD_UP)
		gpio.setup(pin, gpio.IN)
		gpio.add_event_detect(pin, gpio.FALLING, bouncetime=30)
		gpio.add_event_callback(pin, callback_function)

	
#hw = CtrlHardware()

#hw.initOutputs()
#hw.changeOutput(pin=6, state=1)
#hw.changeOutput(pin=5, state=1)
#hw.setOutput(0x80)

#hw.initPWM(36)
#hw.setPWM(36, 1000, 50)
