#!/usr/bin/python3

import subprocess as sub
import time


def main():
	''' This script will sniff all packets in the range of a wifi-card enabled in monitor mode'''

	interface = input('What interface are you using? ')

	# bring the network interface down
	sub.call(['ifconfig', interface, 'down'])

	# put the wifi card in monitor mode
	sub.call(['iwconfig', interface, 'mode', 'monitor'])

	# ifconfig $int up

	# run airodump-ng to sniff packets
	p = sub.Popen(['airodump-ng', interface])

	# Wait 5 seconds
	time.sleep(5)

	# Stop airodump-ng
	p.kill()

	# ifconfig wlan1 down		# bring the network interface down
	# iwconfig wlan1 mode managed	# put the wifi card back into managed mode
	# ifconfig wlan1 up		# bring the network interface back up


if __name__ == '__main__':
	main()
