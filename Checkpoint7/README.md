# Checkpoint 7 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Taamer Faruk**
- **STUDENT'S NUMBER: 160778213**
- **GITHUB USER ID: 160778213-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A – Logging Packets with Specific Prefixes](#header1)
2. [Part B - Filtering Logged Packets](#header2)
3. [Part C - Analyzing Logged Packets](#header3)
4. [Part D - Azure Cost Analysis Charts](#haeder4)

### Part A – Logging Packets with Specific Prefixes

***Link to bash script for lr_firewall_log.sh:***
https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint7/lr_firewall_log.sh 

***Link to iptables -nvL --line output file (lr_firewalls_log.txt):***
https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint7/lr_firewalls_log.txt

```
[tfaruk1@LR-151 workfolder]$ cat lr_firewalls_log.txt
Chain INPUT (policy ACCEPT 2 packets, 80 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      538 31272 LOG        tcp  --  *      *       10.46.66.0/24        192.168.151.36       tcp dpt:22 limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "SSH INPUT LR-151 - "
2        0     0 ACCEPT     tcp  --  *      *       10.46.66.0/24       192.168.151.36        tcp dpt:22

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1       22  1344 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.37        tcp dpt:22 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "SSH FORWARD LS-151 - "
2       22  1344 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.32/27     tcp dpt:22
3       19  1644 ACCEPT     tcp  --  *      *       172.17.151.32/27     10.46.66.0/24        tcp spt:22
4      914  117K LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:3389 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "RDP FORWARD WS-151 - "
5     1307  261K ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.32/27     tcp dpt:3389
6     1933  872K ACCEPT     tcp  --  *      *       172.17.151.32/27     10.46.66.0/24        tcp spt:3389
7        0     0 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS TCP FORWARD - "
8       28  2080 LOG        udp  --  *      *       10.46.66.0/24        172.17.151.36        udp dpt:53 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "DNS UDP FORWARD - "
9        0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            172.17.151.36        tcp dpt:53
10       0     0 ACCEPT     tcp  --  *      *       172.17.151.36        0.0.0.0/0            tcp spt:53
11      28  2080 ACCEPT     udp  --  *      *       0.0.0.0/0            172.17.151.36        udp dpt:53
12      25  4410 ACCEPT     udp  --  *      *       172.17.151.36        0.0.0.0/0            udp spt:53
13       4   228 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.37        tcp dpt:3306 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "MySQL FORWARD LS-151 - "
14       4   228 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.37        tcp dpt:3306
15       2   234 ACCEPT     tcp  --  *      *       172.17.151.37        10.46.66.0/24        tcp spt:3306
16      28  4524 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.37        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD LS-151 - "
17      28  4524 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.37        tcp dpt:80
18      24  2246 ACCEPT     tcp  --  *      *       172.17.151.37        10.46.66.0/24        tcp spt:80
19      24  3284 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:80 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "HTTP FORWARD WS-151 - "
20      24  3284 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:80
21      24  2248 ACCEPT     tcp  --  *      *       172.17.151.36        10.46.66.0/24        tcp spt:80
22      73  3434 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:21 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP CONTROL PLANE FORWARD WS-151 - "
23      89  4280 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpt:21
24      89  6103 ACCEPT     tcp  --  *      *       172.17.151.36        10.46.66.0/24        tcp spt:21
25      33  2922 LOG        tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpts:50000:51000 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "FTP DATA PLANE FORWARD WS-151 - "
26      40  3202 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.36        tcp dpts:50000:51000
27      34  4362 ACCEPT     tcp  --  *      *       172.17.151.36        10.46.66.0/24        tcp spts:50000:51000
28       6  7560 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"

Chain OUTPUT (policy ACCEPT 37 packets, 5356 bytes)
num   pkts bytes target     prot opt in     out     source               destination
1      426 94044 LOG        tcp  --  *      *       192.168.151.36       10.46.66.0/24        tcp spt:22 limit: avg 100/sec burst 5 LOG flags 0 level 4 prefix "SSH OUTPUT WC-846072 - "
2      154 64567 ACCEPT     tcp  --  *      *       192.168.151.36       10.46.66.0/24        tcp spt:22
```

### Part B - Filtering Logged Packets

***Link to logged_packets.log file:***
https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint7/logged_packets.log

```
[tfaruk1@LR-151 workfolder]$ cat logged_packets.log
Mar 20 02:34:38 LR-151 kernel: SSH INPUT LR-151 - IN=eth0 OUT= MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=192.168.151.36 LEN=40 TOS=0x00 PREC=0x00 TTL=128 ID=46345 DF PROTO=TCP SPT=56688 DPT=22 WINDOW=14889 RES=0x00 ACK URGP=0
Mar 20 03:21:34 LR-151 kernel: SSH OUTPUT WC-846072 - IN= OUT=eth0 SRC=192.168.151.36 DST=10.46.66.4 LEN=76 TOS=0x08 PREC=0x40 TTL=64 ID=53920 DF PROTO=TCP SPT=22 DPT=56688 WINDOW=296 RES=0x00 ACK PSH URGP=0
Mar 20 03:04:02 LR-151 kernel: DNS UDP FORWARD - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.36 LEN=71 TOS=0x00 PREC=0x00 TTL=127 ID=28064 PROTO=UDP SPT=53082 DPT=53 LEN=51
Mar 20 03:08:18 LR-151 kernel: HTTP FORWARD WS-151 - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=28315 DF PROTO=TCP SPT=61490 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0
Mar 20 03:26:01 LR-151 kernel: DNS UDP FORWARD - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.37 LEN=82 TOS=0x00 PREC=0x00 TTL=127 ID=29082 PROTO=UDP SPT=57500 DPT=53 LEN=62
Mar 20 03:10:22 LR-151 kernel: HTTP FORWARD LS-151 - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.37 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=15077 DF PROTO=TCP SPT=61544 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0
Mar 20 03:11:12 LR-151 kernel: MySQL FORWARD LS-151 - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.37 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=15083 DF PROTO=TCP SPT=58606 DPT=3306 WINDOW=2049 RES=0x00 ACK URGP=0
Mar 20 03:16:42 LR-151 kernel: FTP CONTROL PLANE FORWARD WS-151 - IN=eth0 OUT=eth0 MAC=00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 SRC=10.46.66.4 DST=172.17.151.36 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=28708 DF PROTO=TCP SPT=61703 DPT=21 WINDOW=2050 RES=0x00 ACK URGP=0
```

### Part C - Analyzing Logged Packets

| Packet ID | Date | MAC Address | Protocol | Source Address | Dest. Address | Source Port | Dest. Port | Packet Length | LOG Prefix | Time To Live |
|-|-|-|-|-|-|-|-|-|-|-|
| 46345 | Mar 20 02:34:38 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 10.46.66.4 | 192.168.151.36 | 56688 | 22 | 40 | SSH INPUT LR-151 -  | 128 |
| 53920 | Mar 20 03:21:34 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 192.168.151.36 | 10.46.66.4 | 22 | 56688 | 76 | SSH OUTPUT WC-846072  | 64 |
| 28064 | Mar 20 03:04:02 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | UDP | 10.46.66.4 | 172.17.151.36 | 53082 | 53 | 71 | DNS UDP FORWARD - | 127 |
| 28315 | Mar 20 03:08:18 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 10.46.66.4 | 172.17.151.36 | 61490 | 80 | 52 | HTTP FORWARD WS-151 - | 127 |
| 29082 | Mar 20 03:26:01 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | UDP | 10.46.66.4 | 172.17.151.37 | 57500 | 53 | 62 | DNS UDP FORWARD - | 127 |
| 15077 | Mar 20 03:10:22 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 10.46.66.4 | 172.17.151.37 | 61544 | 80 | 40 | HTTP FORWARD LS-151 - | 127 |
| 15083 | Mar 20 03:11:12 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 10.46.66.4 | 172.17.151.37 | 58606 | 3306 | 40 | MySQL FORWARD LS-151 - | 127 |
| 28708 | Mar 20 03:16:42 | 00:22:48:ad:cb:a0:fc:bd:67:52:61:dd:08:00 | TCP | 10.46.66.4 | 172.17.151.36 | 61703 | 21 | 40 | FTP CONTROL PLANE FORWARD WS-151 - | 127 |


1.
Network packets are given a Packet ID (Packet Identifier) to help identify and monitor them as they move through a network. The packet header contains the packet ID, which is normally created by the sender of the packet.

Depending on the protocol being used, the Packet ID might either follow a pattern or be random. For instance, the Packet ID follows a sequential numbering pattern in TCP protocol.

We may look at the relevant network protocol specifications to demonstrate this. As an example, the TCP protocol definition makes it clear that the Packet ID follows a sequential numbering scheme, whereas the UDP standard makes no such demands. Using a program like Wireshark, we can also look at network packet captures to see the Packet IDs in use and confirm their randomization or sequence.

2. 
Because of Windows dynamic port allocation system, the source port used by the Windows client is often not similar to the type of service requested. The operating system randomly selects a source port number from the range of temporary ports that are accessible whenever a Windows application seeks a network connection (usually up to 65535). When the connection is established, this source port is used for the length of the connection before being released.

With the help of this dynamic port allocation method, different programs can use the network together without interfering with one another, preventing port conflicts and improving network performance.

For example, rather than using port 22, the source port used by the Windows client when initiating an SSH connection to a Linux server will be a random port number up to 65535. This random source port is set for the length of the SSH connection and released at its ending.

The Windows client's request port number can't be fixed. But, by using tools like the netsh command-line utility, the Windows operating system can be set up to use a specified source port for a certain application or connection.

3. 
The source port used by a Windows client to deliver a DNS request will be a randomized port number between 49152 and 65535. The DNS request uses this random source port at that time, and it is then released once it has finished.

By allowing different applications to access the network together without interfering with one another, the usage of a random source port has the advantage of preventing port conflicts and boosting network speed. It also adds a layer of protection by making it more difficult for attackers to guess the source port that will be used by a specific application.

4. 
What is MAC address?

Each network card on a device is assigned a specific code called a MAC address that helps in network identification. Each device has a 12-digit unique code that is used to guarantee data is transmitted to the proper device on the network. It functions as your device's local network equivalent of a postal address.

Can you find the MAC addresses of your Network Interface Cards in Azure Portal? How?
Yes, you can find it. In Azure portal, you can search up Network Interfaces, then select the NIC that of the VM that you want to find the MAC addresss of, then go to Properties, and it should be at the top.


### Part D - Azure Cost Analysis Charts

***1. Screenshot of resources daily costs for last 7 days***
![1](https://user-images.githubusercontent.com/123032283/226249641-4aefee50-3870-42cf-8d99-0230282e8841.jpg)

***2. Scrrenshot of Service daily costs for last 7 days***
![2](https://user-images.githubusercontent.com/123032283/226249707-7a7e2035-3da2-4efb-b154-b84b8263f3b7.jpg)

***3. Screenshot of Resource accumulated costs last 7 days*** 
![3](https://user-images.githubusercontent.com/123032283/226249770-4f87b7b9-8d74-4cf0-8283-ccfd12693c1b.jpg)

***4. Screenshot of Service Name last month pie chart***
![4](https://user-images.githubusercontent.com/123032283/226249803-d4621be4-0f8a-44b1-9435-7e118ee8b511.jpg)

***5. Screenshot of Service Family last month pie chart***
![5](https://user-images.githubusercontent.com/123032283/226249841-d3a0716c-2ad3-4289-9751-8aa08b6bea3e.jpg)

***6. Screenshot of Product last month pie chart***
![6](https://user-images.githubusercontent.com/123032283/226249872-0a7dbe3f-3b44-440f-969b-a7de5b97c521.jpg)
