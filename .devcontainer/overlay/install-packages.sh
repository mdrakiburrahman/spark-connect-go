#!/usr/bin/env -S bash -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    vim \
    wget \
    openjdk-8-jdk

# Install buf CLI
#
echo "Installing buf CLI"
BIN="/usr/local/bin" &&
    VERSION="1.30.1" &&
    curl -sSL \
        "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m)" \
        -o "${BIN}/buf" &&
    chmod +x "${BIN}/buf"

sudo apt-get autoremove -y &&
    sudo apt-get clean -y &&
    sudo rm -rf /var/lib/apt/lists/* &&
    sudo rm -rf /tmp/downloads
