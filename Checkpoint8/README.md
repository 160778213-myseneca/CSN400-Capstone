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

![a1](https://user-images.githubusercontent.com/123032283/228780031-f6281ddc-5ce2-4157-8a78-ff73ef8a727e.jpg)

### Part B – Port Forwarding Basic Connectivity

![b1](https://user-images.githubusercontent.com/123032283/228780060-5f7c53dd-3a49-4363-acf4-f8af9bd5f846.jpg)


### Part C – Logging & Isolating Masqueraded Packets

```
iptables -A FORWARD -p tcp -s 10.46.66.0/24 -d 172.17.151.32/27 --dport 22 -m state --state NEW -j DROP
```

```
iptables -A FORWARD -p tcp -s 10.46.66.0/24 -d 172.17.151.36 --dport 21 -j DROP
```
![c1](https://user-images.githubusercontent.com/123032283/228780110-94cc311d-dfe3-41c5-9341-81b0661c78d8.jpg)

```
Mar 30 07:12:29 LR-151 kernel: FTP DROP CONTROL PLANE WS-151IN=eth0 OUT=eth0 MAC=60:45:bd:5e:b2:31:54:bf:64:c5:c3:42:08:00 SRC=10.46.66.4 DST=172.17.151.36 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=21806 DF PROTO=TCP SPT=54022 DPT=21 WINDOW=64240 RES=0x00 SYN URGP=0
```

```
Mar 30 07:13:06 LR-151 kernel: SSH DROP FORWARD LS-151 - IN=eth0 OUT=eth0 MAC=60:45:bd:5e:b2:31:54:bf:64:c5:c3:42:08:00 SRC=10.46.66.4 DST=172.17.151.37 LEN=52 TOS=0x00 PREC=0x00 TTL=127 ID=10543 DF PROTO=TCP SPT=54046 DPT=22 WINDOW=64240 RES=0x00 SYN URGP=0
```
![c2](https://user-images.githubusercontent.com/123032283/228780148-210ff2bf-cca1-4a88-ad50-dadccbff1437.jpg)

### Part D - Azure Cost Analysis Charts
***1. Screenshot of resources daily costs for last 7 days***
![1](https://user-images.githubusercontent.com/123032283/228780516-9f2243e8-c00e-4039-98c0-3d96d1bfc478.jpg)


***2. Scrrenshot of Service daily costs for last 7 days***
![2](https://user-images.githubusercontent.com/123032283/228780500-2b08880b-b4f9-44f3-a195-15ffb2d3ce84.jpg)


***3. Screenshot of Resource accumulated costs last 7 days*** 
![3](https://user-images.githubusercontent.com/123032283/228780548-8fd83f1b-8a41-4da4-a1e4-1bc1f7136209.jpg)


***4. Screenshot of Service Name last month pie chart***
![4](https://user-images.githubusercontent.com/123032283/228780574-5fb9a069-ec41-465a-9fc9-2be0b8db0197.jpg)


***5. Screenshot of Service Family last month pie chart***
![5](https://user-images.githubusercontent.com/123032283/228780602-f1b0f0cf-3a2d-411a-9099-6b7e233563da.jpg)


***6. Screenshot of Product last month pie chart***
![6](https://user-images.githubusercontent.com/123032283/228780626-687ddf5b-7c3e-4630-9d2d-b6a1bb9e6e6a.jpg)
