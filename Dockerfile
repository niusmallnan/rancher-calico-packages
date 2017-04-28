FROM calico/ctl:v1.0.2
ADD calico-init /etc/calico-init
COPY entry.sh /usr/bin/
ENTRYPOINT ["/usr/bin/entry.sh"]
