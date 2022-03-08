# Build it:
```bash
https://github.com/sonnyyu/easy-rsa
cd easy-rsa
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
docker run -it --rm -v ~/easy-rsa/pki:/pki sonnyyu/easy-rsa:3
```
# Setup alias
```bash
nano  ~/.bashrc
#My custom aliases
alias easy-rsa="docker run -it --rm -v ~/easy-rsa/pki:/pki sonnyyu/easy-rsa:3"
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
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.204"  build-server-full localhost
easy-rsa build-client-full client1
easy-rsa export-p12  client1
```
# move all the certificate to local directory
```bash
export workdir=~/easy-rsa
sudo -E cp $workdir/pki/pki/ca.crt $workdir/cert 
sudo -E cp $workdir/pki/pki/private/client1.key $workdir/cert
sudo -E cp $workdir/pki/pki/private/client1.p12 $workdir/cert
sudo -E cp $workdir/pki/pki/issued/client1.crt $workdir/cert
sudo -E cp $workdir/pki/pki/private/localhost.key  $workdir/cert
sudo -E cp $workdir/pki/pki/issued/localhost.crt $workdir/cert
cd $workdir/cert
sudo chmod 644  *
```
# The certificate at pki directory
```
├── ca.crt
├── certs_by_serial
│   └── 86F1FF8296AC23318EE61CDD28253DB0.pem
├── index.txt
├── index.txt.attr
├── index.txt.attr.old
├── index.txt.old
├── issued
│   └── 192.168.1.204.crt
├── openssl-easyrsa.cnf
├── private
│   ├── 192.168.1.204.key
│   └── ca.key
├── renewed
│   ├── certs_by_serial
│   ├── private_by_serial
│   └── reqs_by_serial
├── reqs
│   └── 192.168.1.204.req
├── revoked
│   ├── certs_by_serial
│   ├── private_by_serial
│   └── reqs_by_serial
├── safessl-easyrsa.cnf
├── serial
└── serial.old
```
# nginx/conf/ssl.conf
```
server {
  listen 443 ssl;
  ssl_certificate /etc/nginx/conf.d/192.168.1.204.crt;
  ssl_certificate_key /etc/nginx/conf.d/192.168.1.204.key;
  location / {
	#
     root   /usr/share/nginx/html;
     index  index.html index.htm;
 }
}
```

# Copy certificate back 
```bash
export workdir=~/easy-rsa
sudo -E cp $workdir/pki/pki/ca.crt $workdir 
sudo -E cp $workdir/pki/pki/private/client1.p12 $workdir
sudo -E cp $workdir/pki/pki/issued/client1.crt $workdir
sudo -E cp $workdir/pki/pki/private/192.168.1.204.key  $workdir
sudo -E cp $workdir/pki/pki/issued/192.168.1.204.crt $workdir
sudo chmod 644  192.168.1.204.crt 192.168.1.204.key ca.crt client1.p12 client1.crt
```
# Getting started nginx with certificate
```bash
docker-compose up -d
```
# Quit 
```bash
docker-compose down 
```
# Quit and remove Volume
```bash
docker-compose down -v
```

# Open web interface
https://[IP]



