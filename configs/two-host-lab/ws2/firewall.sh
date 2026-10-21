#!/bin/sh
# /etc/firewall.sh (ws2) — allow first: ACCEPT matches before DROP, host answers ping

iptables -F
iptables -X

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP
