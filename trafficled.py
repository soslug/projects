#!/usr/bin/python
# TrafficLED by Derek Shaw
# Specifically for RPi B+

import time
import RPi.GPIO as GPIO

GPIO.setwarnings(False)
GPIO.cleanup()
GPIO.setmode(GPIO.BOARD)

# Prepare GPIO library to use Raspberry Pi
# Board Pinouts

# Pinout Set$1
GPIO.setup(3, GPIO.OUT)
GPIO.setup(5, GPIO.OUT)
GPIO.setup(7, GPIO.OUT)

# Pinout Set$2
GPIO.setup(8, GPIO.OUT)
GPIO.setup(10, GPIO.OUT)
GPIO.setup(12, GPIO.OUT)

# Pinout Set$3
GPIO.setup(19, GPIO.OUT)
GPIO.setup(21, GPIO.OUT)
GPIO.setup(23, GPIO.OUT)

# Pinout Set$4
GPIO.setup(22, GPIO.OUT)
GPIO.setup(24, GPIO.OUT)
GPIO.setup(26, GPIO.OUT)

# Pinout Set$5
#GPIO.setup(33, GPIO.OUT)
#GPIO.setup(35, GPIO.OUT)
#GPIO.setup(37, GPIO.OUT)

# Pinout Set$6
#GPIO.setup(36, GPIO.OUT)
#GPIO.setup(38, GPIO.OUT)
#GPIO.setup(40, GPIO.OUT)

#Turn off all GPIO outputs
GPIO.output(3, GPIO.LOW)
GPIO.output(5, GPIO.LOW)
GPIO.output(7, GPIO.LOW)
GPIO.output(8, GPIO.LOW)
GPIO.output(10, GPIO.LOW)
GPIO.output(12, GPIO.LOW)
GPIO.output(19, GPIO.LOW)
GPIO.output(21, GPIO.LOW)
GPIO.output(23, GPIO.LOW)
GPIO.output(22, GPIO.LOW)
GPIO.output(24, GPIO.LOW)
GPIO.output(26, GPIO.LOW)
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
	# Turn on the Yellow LED pinout 5 & 24
	# Yellow light on with Red
 	GPIO.output(5, GPIO.HIGH)
	GPIO.output(24, GPIO.HIGH)
	time.sleep(2)
	# Turn off the Yellow LED pinout 5 & 24
	# Red and Yellow lights off
	GPIO.output(5, GPIO.LOW)
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
