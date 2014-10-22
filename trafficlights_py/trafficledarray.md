TrafficLEDs_py
==============

This for now is a single or set Python scripts to control Pi_stop Traffic Lights and others examples thereof, it is a set of open source programming examples designed to explore and teach programming concepts through the process of creating new safe interactions, before attaching external hardware. We emphasises the importance of creativity in the learning process and gives users the opportunity to explore their ideas into reality.

You are free to fork your own interpretations of this program and submit your pull request, as this is as much about learning programming as it is about learning Github.

Although this program was written with Raspberry Pi B+ in mind this incantation will work or should work on any RPi and specifically with PiStop as this allows for all four connections. The pins used are detailed within the program however they are 3, 5, 7, 9 + 19, 21, 23, 25 + 6, 8, 10, 12 + 20, 22, 24 and 26 where 6, 9, 20 and 25 are Gnd

Download using git clone https://gihub.com/soslug/TrafficLEDs_py.git

Change directory to the TrafficLEDs 
chmod +x trafficled.py

As you are using writing to GPIO you will need to execute the program as sudo

sudo ./trafficled.py 

Please modify this program as you see fit.
