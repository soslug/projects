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
pattern1 = array('i',[3,8,23,26])
pattern2 = array('i',[8,23])
pattern3 = array('i',[5,10,21,24])
pattern4 = array('i',[3,5,10,21,24,26])
pattern5 = array('i',[7,12,19,22])
pattern6 = array('i',[7,22])
pattern7 = array('i',[5,10,12,19,21,24])
 

for i in gpio_array:
	GPIO.setup(i, GPIO.OUT)
	GPIO.output(i, GPIO.LOW)

time.sleep(8)

while True:
	# Pattern1	
	# Turn on the Red LED pinout 3 & 26
	# Turn on the Green LED pinout 8 & 23
	for i in pattern1:
		GPIO.output(i, GPIO.HIGH)

	time.sleep(4)

	# Pattern2
	# Turn off Green LEDs pinout 8 & 23
	for i in pattern2:
		GPIO.output(i, GPIO.LOW)
	
	# Pattern3
	# Turn on the Yellow LED pinout 5, 10, 21 & 24
	# Yellow light on with Red 3, 26
	for i in pattern3:
		GPIO.output(i, GPIO.HIGH)
 	
	time.sleep(2)

	# Pattern4
	# Turn off the Yellow LED pinout 2, 5, 10, 21, 24 & 26
	# Red and Yellow lights off
	for i in pattern4:
		GPIO.output(i, GPIO.LOW)

	# Pattern5
	# Turn on the Green LED pinout 8 & 23
	for i in pattern5:
		GPIO.output(i, GPIO.HIGH)

	time.sleep(4)

	# Pattern6
	# Turn off the Green LED pinout 7 & 22
	for i in pattern6:
		GPIO.output(i, GPIO.LOW)
		
	# Turn off the Green LED pinout 7 & 22
	for i in pattern3:
		GPIO.output(i, GPIO.LOW)

	# Pattern3
	# Turn on the Yellow LED pinout 5 & 24
	# Turn on the Yellow LED pinout 10 & 21
	for i in pattern3:
		GPIO.output(i, GPIO.HIGH)

	time.sleep(2)

	# Pattern7
	# Turn off the Red LEDs pinout 12 & 19
	# Turn off the Yellow LED pinout 5 & 24
	# Turn off the Yellow LED pinout 10 & 21

	for i in pattern7:
		GPIO.output(i, GPIO.LOW)

