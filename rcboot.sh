#!/bin/sh
export PATH=/usr/bin:/usr/sbin:/bin:/sbin
umask 0077

set -e

if [ "$1" != "stop" ]; then

  cat /etc/hostname > /proc/sys/kernel/hostname

else

  echo "The system is going to shutdown..."

fi;
