## open Webserver ##
iptables -A INPUT -p tcp --dport 8080 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 8080 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

## open Nginx http/https ##
iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tdp --sport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

## open ssh port ##
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

## open Webmin port ##
iptables -A INPUT -p tcp --dport 10000 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 10000 -m state --state NEW,ESTABLISHED -j ACCEPT

## open ftp port ##
iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 20 -j ACCEPT

iptables -t filter -A OUTPUT -p udp --dport 161 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 161 -j ACCEPT

## open dns port##

iptables -A OUTPUT --protocol udp --destination-port 53 -j ACCEPT
iptables -A INPUT --protocol udp --destination-port 53 -j ACCEPT

iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -m limit --limit 5/s -j ACCEPT




## Drop all traffic ##

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
