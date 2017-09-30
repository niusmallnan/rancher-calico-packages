#!/bin/sh

set -ex

while ! ./calicoctl get node >/dev/null 2>&1; do
    sleep 2
done

SUBNET=${SUBNET:-192.168.0.0/16}

# There is a problem in alpine sed
# Need to use lowercase
sed -i "s|\$subnet|$SUBNET|g" /etc/calico-init/ippool.yml

./calicoctl apply -f /etc/calico-init/ippool.yml
./calicoctl apply -f /etc/calico-init/profile.yml

/bin/sh
