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
easy-rsa --subject-alt-name="DNS:www.test.com,IP:192.168.1.204"  build-server-full localhost nopass
easy-rsa build-client-full client1 nopass
easy-rsa export-p12  client1
```
# Move all the certificate to local directory
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


