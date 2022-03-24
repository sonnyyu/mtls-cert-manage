#!/bin/bash
export serverip="192.168.1.204"
export workdir="/home/sonnyyu/mtls-cert-manage/pki"
sudo rm $workdir/pki/private/$serverip.key
sudo rm $workdir/pki/issued/$serverip.crt
sudo rm $workdir/pki/reqs/$serverip.req
sudo easyrsa --passin=file:capassfile --subject-alt-name="DNS:localhost,IP:$serverip" \
build-server-full $serverip nopass
sudo rm -R $workdir/splunkcerts
mkdir  $workdir/splunkcerts
sudo cp $workdir/pki/private/$serverip.key  $workdir/splunkcerts
sudo cp $workdir/pki/issued/$serverip.crt $workdir/splunkcerts
sudo cp $workdir/pki/ca.crt $workdir/splunkcerts
cd $workdir/splunkcerts
sudo chown sonnyyu:sonnyyu *
# add password into private key
#openssl rsa -aes256 -in $serverip.key -out $serverip.pw.key
# convert crt to pem
openssl x509 -inform PEM -in $serverip.crt > $serverip.pem
# genarate server.pem
cat $serverip.pem $serverip.key ca.crt > server.pem
sudo chown sonnyyu:sonnyyu *
sudo chmod 644  *
