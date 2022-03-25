#!/bin/bash
export clientname="client1"
export workdir="/home/sonnyyu/mtls-cert-manage/pki"
sudo rm $workdir/pki/private/$clientname.key
sudo rm $workdir/pki/issued/$clientname.crt
sudo rm $workdir/pki/reqs/$clientname.req
sudo easyrsa --passin=file:capassfile build-client-full $clientname nopass
sudo easyrsa --passout=file:p12passfile export-p12 $clientname
#sudo rm -R $workdir/haproxycerts
#mkdir  $workdir/haproxycerts
sudo rm $workdir/clientcerts/*
sudo cp $workdir/pki/private/$clientname.key  $workdir/clientcerts
sudo cp $workdir/pki/private/$clientname.p12  $workdir/clientcerts
sudo cp $workdir/pki/issued/$clientname.crt $workdir/clientcerts
sudo cp $workdir/pki/ca.crt $workdir/clientcerts
cd $workdir/clientcerts
sudo chown sonnyyu:sonnyyu *
sudo chmod 644  *
