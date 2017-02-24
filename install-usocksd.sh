#!/bin/bash
set -e

USER=$1
GROUP=$2

export GOPATH=/opt/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

echo "Downloading usocksd ..."

go get -u github.com/cybozu-go/usocksd/...

echo "Creating usocksd configuration file ..."

cat > /etc/usocksd.toml << EOF
[log]
filename = "/var/log/usocksd.log"  # default to stderr.
level = "info"                     # critical, error, warning, info, debug
format = "plain"                   # plain, logfmt, json

[incoming]
port = 1080
addresses = ["127.0.0.1"]          # List of listening IP addresses

EOF

echo "Creating usocksd service file ..."

cat > /etc/systemd/system/usocksd.service << EOF
[Unit]
Description=SOCKS5 Proxy Server
After=network.target

[Service]
User=$USER
Group=$GROUP
ExecStart=/opt/go/bin/usocksd -f /etc/usocksd.toml

[Install]
WantedBy=multi-user.target

EOF

touch /var/log/usocksd.log
chown $USER:$GROUP /var/log/usocksd.log

echo "Starting usocksd ..."

service usocksd start
