#!/bin/bash

# shows MAC addresses and other info of all devices connected to the network

netdiscover -i eth0 -r 192.168.1.1/24
