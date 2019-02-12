#!/usr/bin/python3

import subprocess as sub
import time
import wifi_card


def main():
	''' Main function for testing purposes'''

	interface = input('What is your interface? ')

	# Put wifi card into monitor mode
	wifi_card.monitor_mode(interface)

	access_point(interface)	

	# Put wifi card into managed mode
	wifi_card.managed_mode(interface)


def alltraffic(interface):
	''' This function will sniff all wifi packets traffic in the vicinity'''

	# run airodump-ng to sniff packets
	p = sub.Popen(['airodump-ng', interface])

	# Wait 6 seconds
	time.sleep(6)

	# Stop airodump-ng
	sub.call(['killall', 'airodump-ng'])

	return


def access_point(interface, bssid, ch):
	''' This function will sniff packets from devices connected to a particular access point'''

	# run airodump on the selected network
	sub.Popen(['airodump-ng', '--channel', ch, '--bssid', bssid, interface])

	# Wait 6 seconds
	time.sleep(6)

	# Kill the airodump-ng process
	sub.call(['killall', 'airodump-ng'])

	return 


if __name__ == '__main__':
	main()
