#!/bin/bash

ADDARCH=$1

if [ -z "$ADDARCH" ]; then
  echo "error: no arch specified"
  exit 1
fi

source PKGBUILD
if grep -q "^arch=" PKGBUILD; then
  if [[ ! " ${arch[*]} " =~ " any " ]]; then
    if [[ ! " ${arch[*]} " =~ " ${ADDARCH} " ]]; then
      echo "$PKG does not contain ${ADDARCH}"
      arch+=("$ADDARCH")
      archs="${arch[@]}"
      sed -i "s/^arch=\(.*\)$/arch=\($archs\)/g" PKGBUILD
      grep "^arch=" PKGBUILD
    fi
  fi
else
  echo "$PKG does not contain arch info"
fi

