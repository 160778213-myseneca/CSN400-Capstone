# Checkpoint6 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Taamer Faruk**
- **STUDENT'S NUMBER: 160778213**
- **GITHUB USER ID: 160778213-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A - DevTest Lab VM Configuration](#header1)
2. [Part B - Linux VMs Firewall Setting](#header2)
3. [Part C - Enable ip-forwarding in NIC](#header4)
4. [Part D - Basic Connectivity](#header3)
5. [Part E - Azure Cost Analysis Charts](#header4)


Part A - DevTest Lab VM Configuration

Part B - Linux VMs Firewall Setting



Part C - Enable ip-forwarding in NIC

***az network nic show -g Student-RG-846072 -n LR-151 --query "enableIpForwarding"***

```
true
```



Part D - Basic Connectivity

```
[tfaruk1@LR-151 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 5629 1183K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    2   104 ACCEPT     tcp  --  *      *       10.46.66.0/24        0.0.0.0/0            state NEW tcp dpt:22
  112 20622 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_INPUT"
  112 20622 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
  111 12130 ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.32/27     tcp dpt:22
  100 14030 ACCEPT     tcp  --  *      *       172.17.151.32/27     10.46.66.0/24        tcp spt:22
 9827  863K ACCEPT     tcp  --  *      *       10.46.66.0/24        172.17.151.32/27     tcp dpt:3389
11794 4246K ACCEPT     tcp  --  *      *       172.17.151.32/27     10.46.66.0/24        tcp spt:3389
    9 11340 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0            limit: avg 10/sec burst 5 LOG flags 0 level 4 prefix "TO_DROP_FORWARD"
    9 11340 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 7389 1764K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
```
Part E - Azure Cost Analysis Charts