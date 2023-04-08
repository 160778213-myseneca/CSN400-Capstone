# to flush NAT tables
iptables -t nat -F

# to allow other students to access APACHE server
iptables -t nat -A PREROUTING -p tcp --dport 18151 -m limit --limit 100/sec -j LOG --log-prefix "APACHE-nat-log - "
iptables -t nat -A PREROUTING -p tcp --dport 18151 -j DNAT --to-destination 172.17.151.37:80

# to allow other students to access MySQL server
iptables -t nat -A PREROUTING -p tcp --dport 16151 -m limit --limit 100/sec -j LOG --log-prefix "MySQL-nat-log - "
iptables -t nat -A PREROUTING -p tcp --dport 16151 -j DNAT --to-destination 172.17.151.37:3306

# to allow other students to access Linux server - SSH
iptables -t nat -A PREROUTING -p tcp --dport 12151 -m limit --limit 100/sec -j LOG --log-prefix "SSH-nat-log - "
iptables -t nat -A PREROUTING -p tcp --dport 12151 -j DNAT --to-destination 172.17.151.37:22

# to allow other students to access IIS server
iptables -t nat -A PREROUTING -p tcp --dport 19151 -m limit --limit 100/sec -j LOG --log-prefix "IIS-nat-log - "
iptables -t nat -A PREROUTING -p tcp --dport 19151 -j DNAT --to-destination 172.17.151.36:80

# to allow other students to access Windows server - RDP
iptables -t nat -A PREROUTING -p tcp --dport 13151 -m limit --limit 100/sec -j LOG --log-prefix "RDP-nat-log - "
iptables -t nat -A PREROUTING -p tcp --dport 13151 -j DNAT --to-destination 172.17.151.36:3389

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE