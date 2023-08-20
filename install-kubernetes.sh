#!/bin/bash

 # GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
 # Anagnostakis Ioannis GR 8/2023

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

BULDIR=/tmp/Kubernetes
URL1="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
URL2="https://download.virtualbox.org/virtualbox/7.0.10/VirtualBox-7.0.10-158379-Linux_amd64.run"
URL3="https://slackbuilds.org/slackbuilds/15.0/network/kubectl.tar.gz"
URL4="https://storage.googleapis.com/kubernetes-release/release/v1.28.0/bin/linux/amd64/kubectl"
SLACK=kubectl
PACKG=kubectl-1.28.0
VBOX="VirtualBox-7.0.10-158379-Linux_amd64.run"

mkdir -p $BULDIR
cd $BULDIR || exit 1
wget -c -b wget.log $URL1 $URL2 $URL3 
wait
install minikube-linux-amd64 /usr/local/bin/minikube
tar -xvf $SLACK.tar.gz
cd $SLACK || exit 2
wget -c -b wget2.log $URL4
chmod +x $SLACK.SlackBuild
sed -i 's/1.23.0/1.28.0/g' $SLACK.SlackBuild || exit 3
bash $SLACK.SlackBuild
installpkg /tmp/$PACKG*.tgz || exit 4
wait
bash "$VBOX"
wait
echo ""
echo "RUN SCRIPT run-kubernetes.sh NOW AS USER"
echo "NOT ROOT..."
echo ""

