#!/bin/bash

###########################
#          WASH           #
###########################

# Requires wash package

# WPA and WPA2 encryption are improvements over WEP
# Some routers and other devices have WPS buttons that can be exploited
# Instead of having to enter a pass key, WPS generates a 8 digit pin that can be cracked with brute force
# This is a flaw with the router, not WPA itself

# ifconfig wlan1 down
# iwconfig wlan1 mode monitor

# airmon-ng start wlan1

ifconfig

echo 'First run this tool, then reaver in another window'
echo ''

echo 'What interface are you using?'
read interface

echo ''
echo "These are access points in your vicinity..."

wash -i $interface --ignore-fcs				# check for access points that have WPS enabled

