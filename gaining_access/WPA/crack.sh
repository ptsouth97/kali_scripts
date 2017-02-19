#!/bin/bash

#########################
#      WPA CRACK        #
#########################

# After capturing the handshake and generating a wordlist, use aircrack-ng to determine key for target access point
# Aircrack goes through wordlist file and combines each password with the name of target access point to create PMK (Pairwise Master Key)
# PMK uses pbkdf2 algorithm to encrypt and then compare PMK to handshake

# aircrack-ng [HANDSHAKE FILE] -w [WORDLIST]
# e.g., aircrack-ng is-01.cap -w list

echo "What is the name of the file with the handshake?"
read handshake

echo "What is the name of the wordlist file?"
read wordlist

aircrack-ng $handshake -w wordlist
