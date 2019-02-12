#!/usr/bin/python3

import subprocess as sub
import time
import wifi_card


def main():
	''' This script will sniff all packets in the range of a wifi-card enabled in monitor mode'''

	interface = input('What interface are you using? ')

	# Put the wifi card into monitor mode
	wifi_card.monitor_mode(interface)

	# run airodump-ng to sniff packets
	p = sub.Popen(['airodump-ng', interface])

	# Wait 5 seconds
	time.sleep(5)

	# Stop airodump-ng
	sub.call(['killall', 'airodump-ng'])

	# Put the wifi card into managed mode
	wifi_card.managed_mode(interface)


if __name__ == '__main__':
	main()
