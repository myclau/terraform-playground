# Pre-requirement
1. install terraform
2. run 

```
terraform init
```

3. login azure with azure cli

```
az login 
```

if china

```
az login -e AzureChinaCloud
```

4. You will find the subscription id after login and copy the id and run this

```
az account set --subscription="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

5. and run this

```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

6. it will output the somthing like

```
{
  "appId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "displayName": "azure-cli-2019-06-18-07-25-41",
  "name": "http://azure-cli-2019-06-18-07-25-41",
  "password": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "tenant": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}
```

7. edit the variables.tf

```
variable "subscriptionId" {
  type        = "string"
  description = "Subscription id"
  default = "<sunscription id>"
}

variable "tenantId" {
  type        = "string"
  description = "Tenant id"
  default = "<tenant>"
}

variable "clientId" {
  type        = "string"
  description = "Client id"
  default = "<appId>"
}

variable "clientSecret" {
  type        = "string"
  description = "Client secret"
  default = "<password>"
}
```
8. update the location and other variables in variables.tf


# create resource group

1. run
```
terraform apply
```

2. said `yes`

# update resource group

1. update tf files
2. run

```
terraform apply
```

# remove resource group

1. run this to destory the resource group

```
terraform destroy
```

2. said yes