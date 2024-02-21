#!/bin/bash

if [ -f "/usr/sbin/plymouthd" ] && [ -f /usr/bin/plymouth ]; then
        mkdir -p /run/plymouth
        /usr/sbin/plymouthd --pid-file /run/plymouth/pid --mode=shutdown --ignore-serial-consoles
        /usr/bin/plymouth show-splash
fi
