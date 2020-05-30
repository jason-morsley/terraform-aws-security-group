# An RKE cluster on AWS

## RKE Security Group

For RKE to create a cluster successfully it requires the security group to 
have the following tag:

```
"kubernetes.io/cluster/[CLUSTER NAME]": "owned"
```

This example demonstrates this.