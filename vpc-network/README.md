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
Apply complete! Resources: 38 added, 0 changed, 0 destroyed.

Outputs:

default_network_acl_id = "acl-040ff0a52290cfef7"
default_route_table_id = "rtb-0d920736fbfb63354"
igw_arn = "arn:aws:ec2:us-east-1:597677688237:internet-gateway/igw-05aeeb2be43ea6fc6"
nat_ids = [
  "eipalloc-0c6c124225d4b3a6d",
  "eipalloc-0541211ca2a7c4213",
  "eipalloc-05e84ac79e9e181df",
]
nat_public_ips = tolist([
  "174.129.230.201",
  "3.222.90.238",
  "34.205.61.49",
])
natgw_ids = [
  "nat-084bae4e435f8232e",
  "nat-074e8f18865b57937",
  "nat-091ff75286dc74874",
]
private_nat_gateway_route_ids = [
  "r-rtb-03d105d383f776d7c1080289494",
  "r-rtb-0ffe34aab7e75442d1080289494",
  "r-rtb-0ecd0f26aec3b940c1080289494",
]
private_route_table_association_ids = [
  "rtbassoc-09948462307672082",
  "rtbassoc-046b517de48236193",
  "rtbassoc-002ee2a2d013da802",
]
private_route_table_ids = [
  "rtb-03d105d383f776d7c",
  "rtb-0ffe34aab7e75442d",
  "rtb-0ecd0f26aec3b940c",
]
private_subnet_arns = [
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-07444d0a2c896c867",
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-0bd800c17e4664f23",
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-0f29f701f5230cca8",
]
private_subnets_cidr_blocks = tolist([
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24",
])
public_internet_gateway_route_id = "r-rtb-072bf264acc520a2c1080289494"
public_network_acl_arn = "arn:aws:ec2:us-east-1:597677688237:network-acl/acl-05fc015fca664a731"
public_route_table_ids = [
  "rtb-072bf264acc520a2c",
]
public_subnet_arns = [
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-08d4ba69058efbc1f",
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-08ff10f7c93803252",
  "arn:aws:ec2:us-east-1:597677688237:subnet/subnet-0deb48c5acde3068c",
]
public_subnets = [
  "subnet-08d4ba69058efbc1f",
  "subnet-08ff10f7c93803252",
  "subnet-0deb48c5acde3068c",
]
public_subnets_cidr_blocks = tolist([
  "10.0.101.0/24",
  "10.0.102.0/24",
  "10.0.103.0/24",
])
vpc_arn = "arn:aws:ec2:us-east-1:597677688237:vpc/vpc-0e8bb8a09c06a44ea"
vpc_cidr_block = "10.0.0.0/16"
vpc_enable_dns_hostnames = true
vpc_enable_dns_support = true
vpc_instance_tenancy = "default"
vpc_main_route_table_id = "rtb-0d920736fbfb63354"
```

To check network connectivity you can go to the [AWS Resource Explorer](https://resource-explorer.console.aws.amazon.com/resource-explorer/home?region=us-east-1#/search) and search for the ARN you're looking for.

## Clean up

Destroy the resources.

```bash
terraform destroy
```

## References

- [Terraform AWS VPC Examples Github Repo](https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/v1.64.0/examples/network-acls/main.tf)