# Checkpoint4 Submission

- **COURSE INFORMATION: xxx**
- **STUDENT’S NAME: xxx**
- **STUDENT'S NUMBER: xxx**
- **GITHUB USER ID: xxx**
- **TEACHER’S NAME: xxx**

### Table of Contents
1. [Part A - Creating Your Unique Network Topology](#part-a)
2. [Part B - Creating Resources in Azure Portal](#part-b)
3. [Part C - Working in Azure CLI Bash](#part-c)

=======

1. [Part A - Creating Your Unique Network Topology](#part-a)

2. [Part B - Creating Resources in Azure Portal](#part-b)

```
done
```

3. [Part C - Working in Azure CLI Bash](#part-c)

```
odl_user [ ~/workfolder/CSN400-Capstone/Checkpoint4 ]$ az network vnet subnet show --resource-group Student-RG-846072 --vnet-name Router-151 --name SN1 --query "{id:id, name:name, addressPrefix:addressPrefix, routeTable:routeTable.id}" --output json
{
  "addressPrefix": "192.168.151.32/27",
  "id": "/subscriptions/e22a2bd0-d760-4866-9918-1c98f501eb6a/resourceGroups/Student-RG-846072/providers/Microsoft.Network/virtualNetworks/Router-151/subnets/SN1",
  "name": "SN1",
  "routeTable": null
}
```

**Screenshot of output:**

![partD-4](https://user-images.githubusercontent.com/123032283/216807684-fc6670d7-0472-4f03-b3be-130bbdcce70e.png)
=======
