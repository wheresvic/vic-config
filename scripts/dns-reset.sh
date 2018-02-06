#!/bin/bash

COMMAND="sudo sed -i 's/canoo.com//g' /etc/resolv.conf"

echo $COMMAND
eval $COMMAND

cat /etc/resolv.conf

