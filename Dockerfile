FROM alpine
RUN apk add --upgrade --no-cache easy-rsa bash && \
    mkdir /pki && \
    rm -rf /var/cache/apk/* /tmp/* && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/bin/easyrsa
#ENV TZ=America/Los_Angeles
COPY docker-entrypoint.sh /
WORKDIR /pki
ENTRYPOINT ["/docker-entrypoint.sh"]
