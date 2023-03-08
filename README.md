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

terraform graph | dot -Tpng > images/graph.png

terraform destroy -target=aws_instance.redirector_http_1
```

### After provisioning is completed


### Terraform Graph

![Setting Up a listener](/images/graph.png)
