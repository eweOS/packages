#!/bin/bash

cd /tmp

mkdir -p ~/.config/osc/
cat <<EOF > ~/.config/osc/oscrc
[general]
apiurl = https://os-build.ewe.moe
[https://os-build.ewe.moe]
user=github
pass=$OSC_PASS
EOF

BRANCH_NAME=$1
OBS_LOC=eweOS:Main/$BRANCH_NAME

if osc branch eweOS:OBS/template $OBS_LOC \
	| grep -q 'already exists'; then
	echo "Creation failed, package exists."
	exit 1
fi

osc checkout $OBS_LOC

sed -i "s:main:$BRANCH_NAME:g" \
	"${OBS_LOC}"/_service

osc commit $OBS_LOC -m "Create package"
