#!/bin/bash

apt update -y

# Enable GatewayPorts
sed -i 's/#GatewayPorts no/GatewayPorts yes/' /etc/ssh/sshd_config
grep -q "GatewayPorts yes" /etc/ssh/sshd_config || echo "GatewayPorts yes" >> /etc/ssh/sshd_config

# Restart SSH
systemctl restart ssh

# Open reverse-tunnel port (fallback)
iptables -I INPUT -p tcp --dport 9090 -j ACCEPT