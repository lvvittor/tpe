# 72.20 - Redes de Información
##1C2024 - TPE Infrastructure as Code
## Grupo 8

### Integrantes
- Vittor, Lucas
- Szejer, Ian
- Ortu, Agustina Sol
- Perez Rivera, Mateo

## Project Structure
This repository contains various common use cases of Infrastructure as Code(IaC): each directory contains a use case.
- `compute/`: Deploy a compute unit
- `vpc-network/`: Deploy a VPC with specified CIDR blocks, availability zones, public and private subnets, network ACLs, an Internet Gateway, DNS support, and NAT Gateways.
-  `elb/` : Deploy an ELB with 3 compute instances that handle HTTP requests.
-  `disaster-recovery/` : Deploy an active and a passive enviroment, each with VPC, compute, ELB and autoscaling policy.
-  `s3-static-web` : Deploy an S3 bucket and Cloudfront.

## Running
Go to desired use case directory.
Initialize the terraform.

```bash
terraform init
```

Run the terraform plan and apply.

```bash
terraform plan -out plan.tfplan
terraform apply plan.tfplan
```

### Clean up

Destroy the resources.

```bash
terraform destroy
```
## Dependencies

- [Terraform](https://www.terraform.io/)
