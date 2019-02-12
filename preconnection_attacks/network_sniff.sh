#!/bin/bash

###########################
#     SNIFF NETWORK       #
###########################

# This script will sniff packets from devices connected to a particular access point

#ifconfig wlan0 down					# bring the network interface down
#iwconfig wlan0 mode monitor				# put the wifi card into monitor mode

echo 'What is your interface?'
read interface

airodump-ng $interface

echo 'What network do you want to sniff?'
read bssid

echo ''
echo 'What channel is the network on?'
read ch

airodump-ng --channel $ch --bssid $bssid $interface	# run airodump on the selected network

#ifconfig wlan0 down					# bring the network interface down
#iwconfig wlan0 mode managed				# put the wifi card back into managed mode
#ifconfig wlan0 up					# bring the network interface back up
