#!/bin/bash

if [ -f "/usr/sbin/plymouthd" ] && [ -f /usr/bin/plymouth ]; then
  mkdir -p /run/plymouth
  if [ ! -f /run/plymouth/pid ]; then
    /usr/sbin/plymouthd --pid-file /run/plymouth/pid --mode=shutdown --ignore-serial-consoles
  fi
  /usr/bin/plymouth show-splash
fi
