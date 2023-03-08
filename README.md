### Commands

Need to setup aws creds:
```
export AWS_ACCESS_KEY_ID=<ACCESS_KEY>
export AWS_SECRET_ACCESS_KEY=<AWS_SECRET>
```

#### Copy terraform.tfvars.example and modify

```shell
cp terraform.tfvars.example terraform.tfvars
```


```
terraform init
terraform validate
terraform plan (Only use to plan)


terraform apply
terraform destroy

```