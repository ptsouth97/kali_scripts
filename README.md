# kali_scripts

This is a collection of common exploits associated with the popular penetration testing distribution [Kali linux](https://www.kali.org/).

##Methods for Enabling Monitor Mode:

1. airmon-ng
airmon-ng start wlan0
creates a new name like wlan0mon
airmon-ng stop wlan0
doesn't work for some cards

2. manual method
ifconfig wlan0 down
iwconfig mode monitor
ifconfig wlan0 up

3. airmon-ng another way

ifconfig wlan0 down
airmon-ng check kill
airmon-ng start wlan0
