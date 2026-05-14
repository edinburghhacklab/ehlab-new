FROM ubuntu:24.04

RUN <<EOF
    set -e
    apt-get update
    apt-get -y install just curl ca-certificates
EOF

ENV SOUPAULT_VERSION=5.3.0
RUN <<EOF
    set -e
    curl -vL https://files.baturin.org/software/soupault/$SOUPAULT_VERSION/soupault-$SOUPAULT_VERSION-linux-x86_64.tar.gz | tar xzv
    mv -v ./soupault-$SOUPAULT_VERSION-linux-x86_64/soupault /usr/bin/
EOF
