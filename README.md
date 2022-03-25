# Download easyrsa
```bash
git clone https://github.com/OpenVPN/easy-rsa
sudo ln -s /home/sonnyyu/easy-rsa/easyrsa3/easyrsa /usr/bin/easyrsa
```
# Test it:
```bash
easyrsa
```
# Down load software:
```bash
git clone https://github.com/sonnyyu/mtls-cert-manage/
cd ~/mtls-cert-manage/pki
```
# init-pki & build ca
```bash
easyrsa init-pki
easyrsa build-ca
```
# Update capassfile base on password use at build-ca
```bash
nano capassfile
```
# Build server pem for splunk
```bash
./splunk.sh
```
# Build server pem for Haproxy
```bash
./haproxy.sh
```
# Build client pem without password
```bash
./client.sh
```

# to do
```bash
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.204"  build-server-full localhost nopass
easy-rsa build-client-full client1 
easy-rsa export-p12  client1
```
# Copy all the certificate to local directory
```bash
export workdir=~/mtls-cert-manage
sudo -E cp $workdir/pki/pki/ca.crt $workdir/certs 
sudo -E cp $workdir/pki/pki/private/client1.key $workdir/certs
sudo -E cp $workdir/pki/pki/private/client1.p12 $workdir/certs
sudo -E cp $workdir/pki/pki/issued/client1.crt $workdir/certs
sudo -E cp $workdir/pki/pki/private/localhost.key  $workdir/certs
sudo -E cp $workdir/pki/pki/issued/localhost.crt $workdir/certs
cd $workdir/certs
sudo chmod 644  *
```
# Make server certificate for 192.168.1.203
```bash
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.203"  build-server-full 192.168.1.203 nopass
export workdir=~/mtls-cert-manage
sudo -E cp $workdir/pki/pki/private/192.168.1.203.key  $workdir/certs
sudo -E cp $workdir/pki/pki/issued/192.168.1.203.crt $workdir/certs
cd $workdir/certs
sudo chmod 644  *
# show  certificate
openssl x509 -in  192.168.1.203.crt -text
# add password into private key
openssl rsa -aes256 -in 192.168.1.203.key -out 192.168.1.203.pw.key
# convert crt to pem
openssl x509 -inform PEM -in 192.168.1.203.crt > 192.168.1.203.pem
```
Note: 
- client1.p12 is client p12 file (client certificate)
- ca.crt is CA Certificate 

### Install Certificate at Windows

- [How to import CA Certificate in Windows](https://community.spiceworks.com/how_to/1839-installing-self-signed-ca-certificate-in-windows)
- [How to import client certificate to the Chrome](https://www.wipo.int/pct-safe/en/support/cert_import_backup_chrome.html)
- [How to import client certificate to the Firefox](https://doc.primekey.com/ejbca-cloud/ejbca-cloud-aws/quick-start-guide/import-certificate-to-mozilla-firefox)
- [How to import client certificate to the Microsoft Edge](https://www.wipo.int/pct-safe/en/support/cert_import_backup_edge.html)

### Install Certificate at Mac OS X

- [How to import CA Certificate in Mac OS X](https://www.eduhk.hk/ocio/content/faq-how-add-root-certificate-mac-os-x)
- [How to import client certificate to the Chrome Mac OS X](https://www.comodo.com/support/products/authentication_certs/setup/mac_chrome.php)
- [How to import client certificate to the Firefox Mac OS X](https://www.digicert.com/kb/ssl-support/personal-ids/import-into-firefox-mac.htm)
- [How to import client certificate to the Safari Mac OS X](https://www.digicert.com/kb/ssl-support/p12-import-export-mac-server.htm)

### Install Certificate at Linux (Ubuntu, Debian)
- [How to import CA Certificate in Linux (Ubuntu, Debian)](https://grumpytechie.net/2020/02/25/adding-custom-root-ca-certificates-to-debian/)

### Install Certificate at Linux (CentOS, Red Hat)
- [How to import CA Certificate in Linux (CentOS, Red Hat)](https://it.megocollector.com/tips-and-tricks/add-root-certificates-to-a-centos-linux-server/)




































