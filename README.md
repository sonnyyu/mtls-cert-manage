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
# Run with nmap
```bash
easy-rsa
```
# Use it with:
```bash
easy-rsa init-pki
easy-rsa build-ca
easy-rsa build-server-full "192.168.1.204" --alternate-san-name="IP:192.168.1.204" nopass
sudo su
cd pki/pki/issued
openssl x509 -in 192.168.1.204.crt -text
cp 192.168.1.204.crt /home/sonnyyu/easy-rsa
cp 192.168.1.204.key /home/sonnyyu/easy-rsa
cp ca.crt /home/sonnyyu/easy-rsa
cd /home/sonnyyu/easy-rsa
chmod 644 192.168.1.204.crt  192.168.1.204.key ca.crt
```


