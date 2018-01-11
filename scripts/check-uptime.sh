#!/bin/bash
# Check site every 10 seconds

if [ -z "${1}" ]; then
    echo "Usage ${0} <url>"
    exit
fi

while true; do
    echo "Checking site...";
    /usr/bin/wget $1 --timeout 6 -O - 2>/dev/null | grep "body" && notify-send -t 5000 "Site is back up" "`date --iso-8601=seconds` $1";
    sleep 10;
done;

