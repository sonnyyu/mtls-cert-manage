# Build docker image (optional):
```bash
git clone https://github.com/sonnyyu/mtls-cert-manage
cd mtls-cert-manage
docker build -t easy-rsa .
docker tag easy-rsa sonnyyu/easy-rsa:3
#docker login
docker push sonnyyu/easy-rsa:3
```
# Grab it from dockerhub:
```bash
docker pull sonnyyu/easy-rsa:3
```
# Test it:
```bash
docker run -it --rm -v ~/mtls-cert-manage/pki:/pki sonnyyu/easy-rsa:3
```
# Setup alias
```bash
nano  ~/.bashrc
#My custom aliases
alias easy-rsa="docker run -it --rm -v ~/mtls-cert-manage/pki:/pki sonnyyu/easy-rsa:3"
source ~/.bashrc 
```
# Run with easy-rsa
```bash
easy-rsa
```
# Use it with:
```bash
easy-rsa init-pki
easy-rsa build-ca
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.204"  build-server-full localhost nopass
easy-rsa build-client-full client1 
easy-rsa export-p12  client1
```
# Copy all the certificate to local directory
```bash
export workdir=~/mtls-cert-manage
sudo -E cp $workdir/pki/pki/ca.crt $workdir/cert 
sudo -E cp $workdir/pki/pki/private/client1.key $workdir/cert
sudo -E cp $workdir/pki/pki/private/client1.p12 $workdir/cert
sudo -E cp $workdir/pki/pki/issued/client1.crt $workdir/cert
sudo -E cp $workdir/pki/pki/private/localhost.key  $workdir/cert
sudo -E cp $workdir/pki/pki/issued/localhost.crt $workdir/cert
cd $workdir/cert
sudo chmod 644  *
```
# Make server certificate for 192.168.1.203
```bash
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.203"  build-server-full 192.168.1.203 nopass
export workdir=~/mtls-cert-manage
sudo -E cp $workdir/pki/pki/private/192.168.1.203.key  $workdir/cert
sudo -E cp $workdir/pki/pki/issued/192.168.1.203.crt $workdir/cert
cd $workdir/cert
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



































