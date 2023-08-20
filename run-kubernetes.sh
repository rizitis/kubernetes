#!/bin/bash

BINDIR=/usr/local/bin
SLACK=kubectl
CORE=$(getconf _NPROCESSORS_ONLN)
echo "$CORE"
cpu=$(("$CORE" / 2))
echo "$cpu"
mem=8g
disk=30g

"$BINDIR"/minikube start --cpus="$cpu" --memory="$mem" --disk-size="$disk"
/usr/bin/"$SLACK" get pods -A
