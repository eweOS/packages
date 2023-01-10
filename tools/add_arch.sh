#!/bin/bash

PKGS=$(osc list eweOS:Main)

ADDARCH=aarch64

cd packages

for PKG in ${PKGS[@]}; do
	git switch $PKG
	source PKGBUILD
	if grep -q "^arch=" PKGBUILD; then
		if [[ ! " ${arch[*]} " =~ " any " ]]; then
			if [[ ! " ${arch[*]} " =~ " ${ADDARCH} " ]]; then
				echo "$PKG does not contain ${ADDARCH}"
				arch+=("$ADDARCH")
				archs="${arch[@]}"
				sed -i "s/^arch=\(.*\)$/arch=\($archs\)/g" PKGBUILD
				grep "^arch=" PKGBUILD
				git add .
				git commit -m "Add aarch64 to arch"
				git push origin HEAD
			fi
		fi
	else
		echo "$PKG does not contain arch info"
	fi
done

