#!/bin/bash

###########################
#     SNIFF NETWORK       #
###########################

# This script will sniff packets from devices connected to a particular access point

ifconfig wlan0 down			# bring the network interface down
iwconfig wlan0 mode monitor		# put the wifi card into monitor mode


airodump-ng --channel 11 --bssid C0:56:27:71:8E:24 wlan0	# run airodump on the selected network

ifconfig wlan0 down			# bring the network interface down
iwconfig wlan0 mode managed		# put the wifi card back into managed mode
ifconfig wlan0 up			# bring the network interface back up
