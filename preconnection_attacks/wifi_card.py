#!/usr/bin/python3

import subprocess as sub


def main():
	''' Main function for testing purposes'''

	monitor_mode('wlan1')


def monitor_mode(interface):
	''' Puts wifi card into monitor mode'''

	# bring the network interface down
	sub.call(['ifconfig', interface, 'down'])                    

	# put the wifi card into monitor mode
	sub.call(['iwconfig',  interface, 'mode', 'monitor'])

	return


def managed_mode(interface):
	'''Puts wifi card into managed mode'''

	# bring the network interface down
	sub.call(['ifconfig', interface, 'down'])                

	# put the wifi card back into managed mode
	sub.call(['iwconfig', interface, 'mode', 'managed'])               

	# bring the network interface back up
	sub.call(['ifconfig', interface, 'up'])

	return             
	

if __name__ == '__main__':
	main()
