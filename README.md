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
easy-rsa build-server-full "192.168.1.204" --alternate-san-name="IP:192.168.1.204" nopass
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
# Copy certificate back 
```bash
sudo su
cd pki/pki/issued
openssl x509 -in 192.168.1.204.crt -text
cp 192.168.1.204.crt /home/sonnyyu/easy-rsa
cp 192.168.1.204.key /home/sonnyyu/easy-rsa
cp ca.crt /home/sonnyyu/easy-rsa
cd /home/sonnyyu/easy-rsa
chmod 644 192.168.1.204.crt  192.168.1.204.key ca.crt
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



