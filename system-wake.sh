#!/bin/sh

# put under /lib/systemd/system-sleep/

case $1 in 
    post) 
        echo `date` > /var/log/resume.log
    ;;
esac

