# Checkpoint 8 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Taamer Faruk**
- **STUDENT'S NUMBER: 160778213**
- **GITHUB USER ID: 160778213-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents

1. [Part A – Route Table Updates](#header1)
2. [Part B – Port Forwarding Basic Connectivity](#header2)
3. [Part C – Logging & Isolating Masqueraded Packets](#header3)
4. [Part D - Azure Cost Analysis Charts](#haeder4)

### Part A – Route Table Updates

### Part B – Port Forwarding Basic Connectivity



### Part C – Logging & Isolating Masqueraded Packets

```
iptables -A FORWARD -p tcp -s 10.46.66.0/24 -d 172.17.151.32/27 --dport 22 -m state --state NEW -j DROP
```

```
iptables -A FORWARD -p tcp -s 10.46.66.0/24 -d 172.17.151.36 --dport 21 -j DROP
```

```
Mar 30 07:12:29 LR-151 kernel: FTP DROP CONTROL PLANE WS-151IN=eth0 OUT=eth0 MAC=60:45:bd:5e:b2:31:54:bf:64:c5:c3:42:08:00 SRC=10.46.66.4 DST=172.17.151.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=21806 DF PROTO=TCP SPT=54022 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```
```
Mar 30 07:13:06 LR-151 kernel: SSH DROP FORWARD LS-151 - IN=eth0 OUT=eth0 MAC=60:45:bd:5e:b2:31:54:bf:64:c5:c3:42:08:00 SRC=10.46.66.4 DST=172.17.151.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=10543 DF PROTO=TCP SPT=54046 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0
```


### Part D - Azure Cost Analysis Charts