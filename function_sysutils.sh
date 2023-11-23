#!/bin/bash

_install_sysusers_() {
  install -d "$pkgdir/usr/lib/sysusers.d"
  for FILEPATH in $@; do
    FNAME=`basename $FILEPATH`
    install -Dm0644 $FILEPATH "$pkgdir/usr/lib/sysusers.d/${FNAME%%.*}.conf"
  done
}

_install_tmpfiles_() {
  install -d "$pkgdir/etc/tmpfiles.d"
  for FILEPATH in $@; do
    FNAME=`basename $FILEPATH`
    install -Dm0644 $FILEPATH "$pkgdir/etc/tmpfiles.d/${FNAME%%.*}.conf"
  done  
}
