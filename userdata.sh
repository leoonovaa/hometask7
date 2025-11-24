#!/bin/bash

apt update -y

sed -i 's/#GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config
grep -q "GatewayPorts yes" /etc/ssh/sshd_config || echo "GatewayPorts yes" >> /etc/ssh/sshd_config

systemctl restart ssh

iptables -I INPUT -p tcp --dport 9090 -j ACCEPT
