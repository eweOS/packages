#!/bin/bash

if [ -z $MQ_URL ]; then
	echo "Error: no message queue url specified."
	exit 1
fi
if [ -z $1 ]; then
	echo "Error: no package name specified."
	exit 1
fi
PKGNAME=$1
if [ -z $3 ]; then
	PKGREPO=eweOS/packages
else
	PKGREPO=$3
fi
if [ -z $2 ]; then
	PKGARCH=x86_64
else
	PKGARCH=$2
fi

echo "Dispatch task for building $PKGNAME in $PKGREPO for $PKGARCH..."

PAYLOAD="{\"pkgname\":\"$PKGNAME\",\"pkgrepo\":\"$PKGREPO\"}"
PAYLOAD=`echo $PAYLOAD | sed 's/"/\\\\"/g'`
REQDATA="{\"routing_key\":\"\",\"properties\":{\"headers\":{\"arch\":\"$PKGARCH\"}},\"payload_encoding\":\"string\",\"payload\":\"$PAYLOAD\"}"
curl -s -XPOST \
     	-d $REQDATA \
       	$MQ_URL/api/exchanges/ttzfmhle/dispatch/publish


