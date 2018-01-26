#!/bin/bash

dbus-send --system --print-reply \
  --dest="org.freedesktop.login1" \
  /org/freedesktop/login1 \
  org.freedesktop.login1.Manager.Suspend boolean:true

