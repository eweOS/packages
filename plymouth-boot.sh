#!/bin/env sh

if [ -f "/usr/sbin/plymouthd" ] && [ -f /usr/bin/plymouth ]; then

case "$1" in
  stop)
    mkdir -p /run/plymouth
    if [ ! -f /run/plymouth/pid ]; then
      /usr/sbin/plymouthd --pid-file /run/plymouth/pid --mode=shutdown --ignore-serial-consoles
    fi
    /usr/bin/plymouth show-splash
  ;;

  start)
    if [ -f /run/plymouth/pid ]; then
      /usr/bin/plymouth quit || :
      # ensure pid file is removed
      rm -f /run/plymouth/pid
    fi
  ;;

  *) exit 1 ;;
esac

fi
