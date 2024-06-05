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

There is one diagram as code file in every folder, to run them to generate the diagrams:
Have python3 installed
```bash
pip install diagrams
python3 diagram_file.py
```

### Clean up

Destroy the resources.

```bash
terraform destroy
```
## Secrets and Credentials managin
There are a few approachs for keeping our secrets and credentials safe:

* Local files: The user to deploys the proyect must have local files with the secrets and credentials, this is free, but its not a automatic proccess. All the security relays on the users that deploy de proyects.
* Encripted files in AWS: The credentials become one more resource. this has a small cost. The secrets must be carefully handled. This adds complexity to the structure.
* Secret Store in AWS: Credentials become one more resource, you can use dedicated databases to store the credentials. This can be rotated and add more complexity over them. This is the most expensive alternative but the most secure and mature.


## Dependencies

- [Terraform](https://www.terraform.io/)
