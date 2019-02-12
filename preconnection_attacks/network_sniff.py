#!/usr/bin/python3

import subprocess as sub
import time
import wifi_card


def main():
	'''This script will sniff packets from devices connected to a particular access point'''

	interface = input('What is your interface? ')

	# Put wifi card into monitor mode
	wifi_card.monitor_mode(interface)
	
	# Run airodump-ng
	sub.Popen(['airodump-ng', interface])

	# Wait 12 seconds
	time.sleep(12)
	
	# Kill the airodump-ng process
	sub.call(['killall', 'airodump-ng'])

	# Collect information from user about which network to target
	bssid = input('What network do you want to sniff? ')

	print('')
	ch = input('What channel is the network on? ')

	# run airodump on the selected network
	sub.Popen(['airodump-ng', '--channel', ch, '--bssid', bssid, interface])

	# Wait 12 seconds
	time.sleep(12)

	# Kill the airodump-ng process
	sub.call(['killall', 'airodump-ng'])

	# Put wifi card into managed mode
	wifi_card.managed_mode(interface)


if __name__ == '__main__':
	main()
