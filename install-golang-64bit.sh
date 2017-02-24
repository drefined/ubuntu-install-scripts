#!/bin/bash
set -e

VERSION="1.7.5"
DOWNLOAD_FILE="go$VERSION.linux-amd64.tar.gz"

if [ -d "$HOME/.go" ] || [ -d "$HOME/go" ]; then
    echo "Installation directories already exist. Exiting."
    exit 1
fi

echo "Downloading $DOWNLOAD_FILE ..."

wget https://storage.googleapis.com/golang/$DOWNLOAD_FILE -O /tmp/go.tar.gz

if [ $? -ne 0 ]; then
    echo "Download failed! Exiting."
    exit 1
fi

echo "Extracting ..."

tar -C "$HOME" -xzf /tmp/go.tar.gz

echo "Setting up GOROOT ..."
mv "$HOME/go" /usr/local

touch "$HOME/.bashrc"
{
    echo '# GoLang'
    echo 'export GOPATH=/opt/go'
    echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin'
} >> "$HOME/.bashrc"

echo "Setting up GOPATH ..."
mkdir -p /opt/go/{src,pkg,bin}

echo "Cleaning up $DOWNLOAD_FILE ..."
rm -f /tmp/go.tar.gz
