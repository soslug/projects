#!/usr/bin/python
# TrafficLED by Derek Shaw
# Specifically for RPi B+ but should work on other Pis

import time
import RPi.GPIO as GPIO

def set_gpio():
	# Prepare GPIO library to use Raspberry Pi
	# Board Pinouts

	GPIO.setwarnings(False)
	GPIO.cleanup()
	GPIO.setmode(GPIO.BOARD)

# Initialise set_gpio function

set_gpio()

from array import *
gpio_array = array('i',[3,5,7,8,10,12,19,21,22,23,24,26])

for i in gpio_array:
	GPIO.setup(i, GPIO.OUT)
	GPIO.output(i, GPIO.LOW)

time.sleep(8)

while True:
	
	# Turn on the Red LED pinout 3 & 26
	# Red light stays on
	GPIO.output(3, GPIO.HIGH)
	GPIO.output(26, GPIO.HIGH)
	# Turn on the Green LED pinout 8 & 23
	GPIO.output(8, GPIO.HIGH)
	GPIO.output(23, GPIO.HIGH)
	time.sleep(4)
	# Turn off Green LEDs pinout 8 & 23
	GPIO.output(8, GPIO.LOW)
	GPIO.output(23, GPIO.LOW)
	# Turn on the Yellow LED pinout 5, 10, 21 & 24
	# Yellow light on with Red
 	GPIO.output(5, GPIO.HIGH)
 	GPIO.output(10, GPIO.HIGH)
 	GPIO.output(21, GPIO.HIGH)
	GPIO.output(24, GPIO.HIGH)
	time.sleep(2)
	# Turn off the Yellow LED pinout 5, 10, 21 & 24
	# Red and Yellow lights off
	GPIO.output(5, GPIO.LOW)
	GPIO.output(10, GPIO.LOW)
	GPIO.output(21, GPIO.LOW)
 	GPIO.output(24, GPIO.LOW)
	# Turn off the Red LED pinout 3 & 26
	GPIO.output(3, GPIO.LOW)
	GPIO.output(26, GPIO.LOW)

	# Turn on Green lights
	# Turn off the Green LED pinout 8 & 23
	GPIO.output(8, GPIO.LOW)
	GPIO.output(23, GPIO.LOW)
	# Turn on the Green LED pinout 7 & 22
 	GPIO.output(7, GPIO.HIGH)
	GPIO.output(22, GPIO.HIGH)
	# Turn on the Red LED pinout 12 & 19
	GPIO.output(12, GPIO.HIGH)
	GPIO.output(19, GPIO.HIGH)
	time.sleep(4)
	# Turn off the Green LED pinout 7 & 22
	GPIO.output(7, GPIO.LOW)
	GPIO.output(22, GPIO.LOW)
	# Turn on the Yellow LED pinout 5 & 24
	GPIO.output(5, GPIO.HIGH)
	GPIO.output(24, GPIO.HIGH)
	# Turn on the Yellow LED pinout 10 & 21
	GPIO.output(10, GPIO.HIGH)
	GPIO.output(21, GPIO.HIGH) 
	time.sleep(2)
	# Turn off the Red LEDs pinout 12 & 19
	GPIO.output(12, GPIO.LOW)
	GPIO.output(19, GPIO.LOW)
	# Turn off the Yellow LED pinout 5 & 24
	GPIO.output(5, GPIO.LOW)
	GPIO.output(24, GPIO.LOW)
	# Turn off the Yellow LED pinout 10 & 21
	GPIO.output(10, GPIO.LOW)
	GPIO.output(21, GPIO.LOW)
	# Turn on the Red LED pinout 3 & 26
	GPIO.output(3, GPIO.HIGH)
	GPIO.output(26, GPIO.HIGH)
