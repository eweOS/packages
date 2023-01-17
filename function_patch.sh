#!/bin/bash

_patch_() {
  cd "$srcdir/$1" && shift
  for FILE in ${source[@]}; do
    if [[ $FILE == *.patch ]] then
      echo "patch -p1 < $srcdir/$FILE"
    fi
  done
}
