# Demo

Fill up the necessary variables in `terraform.tfvars` file.

```bash
cp terraform.tfvars.example terraform.tfvars
```

Initialize the terraform.

```bash
terraform init
```

Run the terraform plan and apply.

```bash
terraform plan -out plan.tfplan
terraform apply plan.tfplan
```

The output will be something like this:
```bash
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

elb_dns_name = "hello-world-elb-1728934597.us-east-1.elb.amazonaws.com"
elb_id = "hello-world-elb"
elb_instances = [
  "i-06bfee1f0dc1a2ab0",
  "i-07e25d3df1cb25085",
  "i-0b0966aac51f0528d",
]
elb_name = "hello-world-elb"
elb_source_security_group_id = "sg-0db837558c8109f5a"
elb_zone_id = "Z35SXDOTRQ7X7K"
```

To check if the ELB is working, you can open the browser and go to the `elb_dns_name` output, and see that the ELB is working.

## Clean up

Destroy the resources.

```bash
terraform destroy
```

## References

- [Terraform AWS ELB Github Repo](https://github.com/terraform-aws-modules/terraform-aws-elb/blob/master/examples/complete/main.tf)