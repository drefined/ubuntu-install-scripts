# ubuntu-install-scripts

## Requirements

* Generate SSH key ahead of time

```bash
$ ssh-keygen -t rsa -b 4096 -C "somebody@example.com" -f /home/ubuntu/.ssh/id_rsa.proxy -q -P ""
```

* Set up a proxy server

```bash
$ wget https://raw.githubusercontent.com/drefined/ubuntu-install-scripts/master/setup-proxy.sh
$ chmod +x setup-proxy.sh
$ ./setup-proxy.sh $USER $GROUP $PASS "$SSH_PUB_KEY"
```
