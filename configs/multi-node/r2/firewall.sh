#!/bin/bash
# /etc/firewall.sh (r2) — final version: default-deny forwarding, ICMP, SNAT and DNAT

iptables -F
iptables -t nat -F

iptables -P FORWARD DROP
iptables -A FORWARD -p icmp -j ACCEPT


iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


iptables -A FORWARD -s 10.20.0.0/26 -j ACCEPT

#SNAT
iptables -t nat -A POSTROUTING -s 10.20.0.0/26 -o enp0s3 -j MASQUERADE

#DNAT
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT --to-destination 10.20.0.20:80

iptables -A FORWARD -p tcp -d 10.20.0.20 --dport 80 -j ACCEPT
