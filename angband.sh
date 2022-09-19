#!/bin/sh

pushd /usr/lib/angband/ > /dev/null
./Angband $@
popd > /dev/null
