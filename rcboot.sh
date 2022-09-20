#!/bin/sh
export PATH=/usr/bin:/usr/sbin:/bin:/sbin
umask 0077

set -e

if [ "$1" != "stop" ]; then

  cat /etc/hostname > /proc/sys/kernel/hostname || echo "eweOS" >> /proc/sys/kernel/hostname

  if [ -n "$(ls -A /etc/rcboot.d 2>/dev/null)" ]
  then
    for f in /etc/rcboot.d/*; do
	  bash "$f" 
    done
  fi

else

  echo "The system is going to shutdown..."

fi;
