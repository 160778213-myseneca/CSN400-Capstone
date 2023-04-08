# Checkpoint 9 Submission

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
---
Command I used to make this table: ***az network route-table route show --name "External-Router" --route-table-name "RT-151" --resource-group "Student-RG-846072" --query "{id:id, addressPrefix:addressPrefix, nextHopType:nextHopType, nextHopIpAddress:nextHopIpAddress}" --output table > RT-151-details***
```
cat RT-151-details 
AddressPrefix     NextHopType       NextHopIpAddress
----------------  ----------------  ------------------
192.168.55.32/27  VirtualAppliance  192.168.151.36
```
---
Command I used to make this table: ***az network route-table route show --name "Route-to-Hub" --route-table-name "RT-EX-151" --resource-group "Student-RG-846072" --query "{id:id, addressPrefix:addressPrefix, nextHopType:nextHopType, nextHopIpAddress:nextHopIpAddress}" --output table > RT-EX-151-details***
```
cat RT-EX-151-details 
AddressPrefix     NextHopType       NextHopIpAddress
----------------  ----------------  ------------------
192.168.55.32/27  VirtualAppliance  192.168.99.36
```
--- 
Command I used to make this table: ***az network route-table show --name RT-EX-151 --resource-group "Student-RG-846072" --query "subnets[].id" --output table > RT-EX-151-Subnet***
```
cat RT-EX-151-Subnet 
Result
-------------------------------------------------------------------------------------------------------------------------------------------------------
/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourceGroups/Student-RG-846072/providers/Microsoft.Network/virtualNetworks/Router-151/subnets/SN1
```
### Part B – Port Forwarding Basic Connectivity
---
**My nat_basic-connectivity.sh script:**
```
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
```
---

### Part C – Logging & Isolating Masqueraded Packets
---

**Logged packets in masqueraded-logged.log with proper syntax:**
```
Apr  8 01:41:10 LR-151 kernel: NAT-log-http-masqueradingIN=eth0 OUT=eth0 MAC=60:45:bd:61:d4:3a:74:83:ef:d0:c4:54:08:00 SRC=192.168.55.36 DST=172.17.151.36 LEN=41 TOS=0x00 PREC=0x00 TTL=125 ID=7804 DF PROTO=TCP SPT=50324 DPT=80 WINDOW=2047 RES=0x00 ACK URGP=0
Apr  8 01:40:30 LR-151 kernel: NAT-log-http-masqueradingIN=eth0 OUT=eth0 MAC=60:45:bd:61:d4:3a:74:83:ef:d0:c4:54:08:00 SRC=192.168.55.36 DST=172.17.151.37 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=7802 DF PROTO=TCP SPT=50322 DPT=80 WINDOW=2050 RES=0x00 ACK URGP=0
Apr  8 01:38:58 LR-151 kernel: NAT-log-mysql-masqueradingIN=eth0 OUT=eth0 MAC=60:45:bd:61:d4:3a:74:83:ef:d0:c4:54:08:00 SRC=192.168.55.36 DST=172.17.151.37 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=7773 DF PROTO=TCP SPT=50311 DPT=3306 WINDOW=2049 RES=0x00 ACK FIN URGP=0
Apr  8 01:51:19 LR-151 kernel: NAT-log-rdp-masqueradingIN=eth0 OUT=eth0 MAC=60:45:bd:61:d4:3a:74:83:ef:d0:c4:54:08:00 SRC=192.168.55.36 DST=172.17.151.36 LEN=40 TOS=0x00 PREC=0x00 TTL=125 ID=7814 DF PROTO=TCP SPT=50397 DPT=3389 WINDOW=0 RES=0x00 ACK RST URGP=0
Apr  8 01:45:41 LR-151 kernel: NAT-log-ssh-masqueradingIN=eth0 OUT=eth0 MAC=60:45:bd:61:d4:3a:74:83:ef:d0:c4:54:08:00 SRC=192.168.55.36 DST=172.17.151.37 LEN=52 TOS=0x00 PREC=0x00 TTL=61 ID=60911 DF PROTO=TCP SPT=59164 DPT=22 WINDOW=268 RES=0x00 ACK URGP=0
```

**A screenshot of my marked and isolated packets in masqueraded-capture.pcap:**
![partc1](https://user-images.githubusercontent.com/123032283/230703681-81def61c-a480-4b0e-9694-9cf41ea79ea3.jpg)

### Part D - Azure Cost Analysis Charts

***1. Screenshot of resources daily costs for last 7 days***

![1](https://user-images.githubusercontent.com/123032283/230703939-bac8bfb5-b898-4a51-884d-d09384db740e.jpg)


***2. Scrrenshot of Service daily costs for last 7 days***

![2](https://user-images.githubusercontent.com/123032283/230703945-a6d0e234-f608-4767-9c86-57ee2165a561.jpg)


***3. Screenshot of Resource accumulated costs last 7 days*** 

![3](https://user-images.githubusercontent.com/123032283/230703946-858b4972-ca13-40f3-853e-04e27a7afff3.jpg)


***4. Screenshot of Service Name last month pie chart***

![4](https://user-images.githubusercontent.com/123032283/230703952-b5330058-b21e-4881-a6b9-372d53178c91.jpg)


***5. Screenshot of Service Family last month pie chart***

![5](https://user-images.githubusercontent.com/123032283/230703956-0218b15a-8bc4-4228-b7fb-db56b82a7c72.jpg)


***6. Screenshot of Product last month pie chart***

![6](https://user-images.githubusercontent.com/123032283/230703959-dee66e41-7920-4886-9546-beafef812838.jpg)
