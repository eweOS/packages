#!/bin/bash

[ -n "$LIBMAKEPKG_LINT_PACKAGE_WARNDIRS_SH" ] && return
LIBMAKEPKG_LINT_PACKAGE_WARNDIRS_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "${LIBRARY}/util/message.sh"

lint_package_functions+=('lintdirs')

errordirs() {
    if [ -d "$pkgdir/$1" ] && [ ! -L "$pkgdir/$1" ]; then
        error "Directory error: /$1"
        ret=1
    fi
}

warndirs() {
    if [ -d "$pkgdir/$1" ] && [ ! -L "$pkgdir/$1" ]; then
        warning "Directory warning: /$1"
    fi
}

lintdirs() {
    errordirs lib
    errordirs lib64
    errordirs usr/lib64
    errordirs usr/sbin
    errordirs bin
    errordirs sbin
    errordirs var/run
    errordirs var/lock
    errordirs usr/lib/systemd
    warndirs usr/local
}
