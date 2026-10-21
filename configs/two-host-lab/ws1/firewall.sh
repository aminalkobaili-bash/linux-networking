#!/bin/sh
# /etc/firewall.sh (ws1) — deny first: DROP matches before ACCEPT, host does not answer ping

iptables -F
iptables -X

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
