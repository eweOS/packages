#!/bin/bash

_dinit_install_services_() {
  install -d "$pkgdir/usr/lib/dinit.d"
  for FILEPATH in $@; do
    SERVNAME=`basename $FILEPATH`
    install -Dm0644 $FILEPATH "$pkgdir/usr/lib/dinit.d/${SERVNAME%%.*}"
  done
}

_dinit_install_user_services_() {
  install -d "$pkgdir/usr/lib/dinit.d/user"
  for FILEPATH in $@; do
    SERVNAME=`basename $FILEPATH`
    install -Dm0644 $FILEPATH "$pkgdir/usr/lib/dinit.d/user/${SERVNAME%%.*}"
  done
}

_dinit_install_helpers_() {
  install -d "$pkgdir/usr/lib/dinit/exec"
  for FILEPATH in $@; do
    FNAME=`basename $FILEPATH`
    install -Dm0755 $FILEPATH "$pkgdir/usr/lib/dinit/exec/$FNAME"
  done
}

_dinit_install_user_helpers_() {
  install -d "$pkgdir/usr/lib/dinit/exec/user"
  for FILEPATH in $@; do
    FNAME=`basename $FILEPATH`
    install -Dm0755 $FILEPATH "$pkgdir/usr/lib/dinit/exec/user/$FNAME"
  done
}

_dinit_enable_services_() {
  install -d "$pkgdir/usr/lib/dinit.d/boot.d"
  for SERVNAME in $@; do
    ln -s "/usr/lib/dinit.d/$SERVNAME" "$pkgdir/usr/lib/dinit.d/boot.d/$SERVNAME"
  done
}

_dinit_enable_user_services_() {
  install -d "$pkgdir/usr/lib/dinit.d/user/boot.d"
  for SERVNAME in $@; do
    ln -s "/usr/lib/dinit.d/user/$SERVNAME" "$pkgdir/usr/lib/dinit.d/user/boot.d/$SERVNAME"
  done
}
