#!/bin/bash

######################
# SNIFF ALL PACKETS  #
######################

# This script will sniff all packets in the range of a wifi-card enabled in monitor mode


ifconfig wlan0 down		# bring the network interface down
iwconfig wlan0 mode monitor 	# put the wifi card in monitor mode

airodump-ng wlan0		# run airodump-ng to sniff packets

ifconfig wlan0 down		# bring the network interface down
iwconfig wlan0 mode managed	# put the wifi card back into managed mode
ifconfig wlan0 up		# bring the network interface back up
