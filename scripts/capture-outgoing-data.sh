#!/bin/bash

sudo tcpdump -i any 'tcp and src host 192.168.42.10 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'

# Use the following to get a command
#lsof -i :40174 -F c

# https://github.com/node-pcap/node_pcap

