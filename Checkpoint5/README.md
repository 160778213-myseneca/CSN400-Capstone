# Checkpoint5 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Taamer Faruk**
- **STUDENT'S NUMBER: 160778213**
- **GITHUB USER ID: 160778213-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

 
### Table of Contents

1. [Part A - Creating Resources in Azure Portal](#header1)
2. [Part B - Working with `az lab` CLI command](#header2)
3. [Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images](#header3)
4. [Part D - Azure Cost Analysis Charts](#header4)

###  Part A - Creating Resources in Azure Portal

![a1](https://user-images.githubusercontent.com/123032283/218375900-a9098c69-1262-4fe1-bbc7-71e27bcfaaae.jpg)
![a2](https://user-images.githubusercontent.com/123032283/218375973-a6ad899c-78cc-4238-acaf-7cd4786f46e0.jpg)
![a3](https://user-images.githubusercontent.com/123032283/218375988-596cc5c2-add3-41aa-8ba0-3d4b91f1296e.jpg)
![a4](https://user-images.githubusercontent.com/123032283/218376000-0b50c214-0788-4448-81fc-c5dbbf74d2d4.jpg)
![a5](https://user-images.githubusercontent.com/123032283/218376018-5d7a6e13-5bbd-43dc-9c5c-ea3b50d2a850.jpg)
![a6](https://user-images.githubusercontent.com/123032283/218376030-af8f345b-3b37-4687-af10-b50bdd09126c.jpg)



### Part B - Working with `az lab` CLI command

***Links to each file created in Part C:***
- https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint5/custom_images.tbl
- https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint5/devtest_lab.json
- https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint5/lab_vm.tbl
- https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint5/lab_vnets.tbl 


***Isolated `name` property in `devtest_lab.json` and embed it directly in my `README.md`***

```
 "id": "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-846072/providers/microsoft.devtestlab/labs/csn400-151",
  "labStorageType": "Premium",
  "loadBalancerId": null,
  "location": "canadacentral",
  "mandatoryArtifactsResourceIdsLinux": [],
  "mandatoryArtifactsResourceIdsWindows": [],
  "name": "CSN400-151",
  "networkSecurityGroupId": null,
  "premiumDataDiskStorageAccount": "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourcegroups/student-rg-846072/providers/microsoft.storage/storageaccounts/acsn4001514756",
  "premiumDataDisks": "Disabled",
  "provisioningState": "Succeeded",
  "publicIpId": null,
  "resourceGroup": "student-rg-846072",
  "support": {
    "enabled": "Disabled",
    "markdown": ""
  },
  ```

### Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images

![Part-c](https://user-images.githubusercontent.com/123032283/218376052-d2b5c69b-bd38-40f1-96e4-fe6072e90e2c.jpg)


### Part D - Azure Cost Analysis Charts

***Screenshot of the daily costs for last 7 days***
![d1](https://user-images.githubusercontent.com/123032283/218376499-f84fdb70-0b63-4800-a5b5-935d4873ca3c.jpg)

***Screenshot of the daily costs for service in last 7 days***
![d2](https://user-images.githubusercontent.com/123032283/218376613-37dde61b-a101-400d-a6f1-0c3771cc63cf.jpg)

***Screenshot of the accumulated costs for resource in last 7 days***
![d3](https://user-images.githubusercontent.com/123032283/218376632-03a214e8-3dfd-465f-b0f8-84e3a1b9f9d3.jpg)

***Screenshot of the pie chart costs for service name in last month***
![d4](https://user-images.githubusercontent.com/123032283/218376659-a6bc1cc3-4fb1-4faa-8775-2065f5d78d93.jpg)

***Screenshot of the pie chart costs for service family in last month***

![d5](https://user-images.githubusercontent.com/123032283/218376678-d17ee5fb-21bb-408a-9d3b-a4d82c0fef4d.jpg)

***Screenshot of the pie chart costs for product in last month***

![d6](https://user-images.githubusercontent.com/123032283/218376691-1172a214-76f5-47fe-8b2e-f41fbc6fffe7.jpg)
