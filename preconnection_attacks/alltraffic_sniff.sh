#!/bin/bash

######################
# SNIFF ALL PACKETS  #
######################

# This script will sniff all packets in the range of a wifi-card enabled in monitor mode

echo 'What interface are you using?'
read int


ifconfig $int down		# bring the network interface down
iwconfig $int mode monitor 	# put the wifi card in monitor mode
# ifconfig $int up

airodump-ng $int # run airodump-ng to sniff packets

# ifconfig wlan1 down		# bring the network interface down
# iwconfig wlan1 mode managed	# put the wifi card back into managed mode
# ifconfig wlan1 up		# bring the network interface back up
