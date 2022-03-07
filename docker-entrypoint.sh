#!/bin/bash

set -e

if [ ! -f "/pki/openssl-1.0.cnf" ]; then
    echo "No OpensslConfig for EasyRsa Found. Copying the default"
    cp /usr/share/easy-rsa/openssl-1.0.cnf /pki/openssl-1.0.cnf
    cp -R /usr/share/easy-rsa/x509-types /pki/x509-types
fi

exec /usr/bin/easyrsa $@
