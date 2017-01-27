#!/bin/bash
set -e

go get -u github.com/cybozu-go/usocksd/...

cat > /etc/usocksd.toml << EOF
[log]
filename = "/var/log/usocksd.log"  # default to stderr.
level = "info"                     # critical, error, warning, info, debug
format = "plain"                   # plain, logfmt, json

[incoming]
port = 1080
addresses = ["127.0.0.1"]          # List of listening IP addresses

EOF

cat > /etc/systemd/system/usocksd.service << EOF
[Unit]
Description=SOCKS5 Proxy Server
After=network.target

[Service]
ExecStart=/opt/go/bin/usocksd -f /etc/usocksd.toml

[Install]
WantedBy=multi-user.target

EOF

service usocksd start
