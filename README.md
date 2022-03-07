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
docker run -it --rm sonnyyu/nmap:7.92 -A scanme.nmap.org
docker run -it --rm sonnyyu/nmap:7.92 -sT -T4 scanme.nmap.org
docker run -it --rm sonnyyu/nmap:7.92 -oA scan -A scanme.nmap.org
docker run -it --rm sonnyyu/nmap:7.92 --script-updatedb
docker run -it --rm sonnyyu/nmap:7.92  -p 445 --script smb-os-discovery  192.168.1.71
docker run -it --rm sonnyyu/nmap:7.92 -p445 --script smb-vuln-ms08-067 192.168.1.71
docker run -it --rm sonnyyu/nmap:7.92 --script ssh-brute.nse 192.168.1.204
```


