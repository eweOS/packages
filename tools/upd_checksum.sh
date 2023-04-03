#!/bin/bash

PKGS=$(osc list eweOS:Main)

cd packages

for PKG in ${PKGS[@]}; do
	git switch $PKG
	updpkgsums
	git add PKGBUILD
	git commit -m "Update checksums"
	git clean -fd
	git push origin HEAD
done

