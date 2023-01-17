#!/bin/bash

_pick_() {
  PKGBASE="$srcdir/pkgs/$1" && shift
  mkdir -p $PKGBASE
  for FILEPATH in $@; do
    (find $FILEPATH | cpio -pdvmu $PKGBASE) || true
    (find $FILEPATH -delete) || true
  done
}
