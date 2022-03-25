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
```
# init-pki & build ca
```bash
cd ~/mtls-cert-manage/pki
easyrsa init-pki
easyrsa gen-dh
easyrsa build-ca
```
# Update capassfile base on password use at build-ca
```bash
nano capassfile
```
# Build server pem for Splunk
```bash
./splunk.sh
```
# Build server pem for Haproxy
```bash
./haproxy.sh
```
# Update p12passfile base on password use for p12 export
```bash
nano p12passfile
```
# Build client pem without private key password
```bash
./client.sh
```
# Update cppassfile base on password use for client private key
```bash
nano cppassfile
```
# Build client pem with private key password
```bash
./clientpw.sh
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
- [How to import CA Certificate in Linux (Ubuntu, Debian)](https://ubuntu.com/server/docs/security-trust-store)

### Install Certificate at Linux (CentOS, Red Hat)
- [How to import CA Certificate in Linux (CentOS, Red Hat)](https://it.megocollector.com/tips-and-tricks/add-root-certificates-to-a-centos-linux-server/)

Secure TLS protocol and cipher configurations for webservers can be generated using Mozilla's [SSL Configuration Generator](https://ssl-config.mozilla.org/). All supported browsers and the Mobile apps are known to work with the "Modern" configuration.
