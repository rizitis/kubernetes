#!/bin/bash
# GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
 # Anagnostakis Ioannis GR 8/2023
 
echo ""
echo "DONT RUN THIS SCRIPT AS ROOT"
echo ""
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
