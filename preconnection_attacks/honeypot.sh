#!/bin/bash

########################
#      HONEY POT       #
########################

# This script creates a fake access point, a.k.a. a 'honey pot'

# Requires mana-toolkit package (apt-get install mana-toolkit)

# First edit these configuration files:
# vim /usr/share/mana-toolkit/run-mana/start-nat-simple.sh
# vim /etc/mana-toolkit/hostapd-mana.conf

bash /usr/share/mana-toolkit/run-mana/start-nat-simple.sh
# ctrl+c stops honey pot

service network-manager restart
