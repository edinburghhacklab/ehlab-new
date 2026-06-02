FROM ubuntu:24.04

RUN <<EOF
    set -e
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y install just curl ca-certificates python3
EOF

RUN <<EOF
    set -e
    cd $(mktemp -d)
    curl -vLO https://github.com/watchexec/watchexec/releases/download/v2.5.1/watchexec-2.5.1-x86_64-unknown-linux-gnu.deb
    apt-get install ./*.deb -y
EOF

ENV SOUPAULT_VERSION=5.3.0
RUN <<EOF
    set -e
    curl -vL https://files.baturin.org/software/soupault/$SOUPAULT_VERSION/soupault-$SOUPAULT_VERSION-linux-x86_64.tar.gz | tar xzv
    mv -v ./soupault-$SOUPAULT_VERSION-linux-x86_64/soupault /usr/bin/
EOF
