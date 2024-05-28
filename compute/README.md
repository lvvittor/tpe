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
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

aws_url = "http://3.80.107.124"
do_url = "http://209.38.141.135"
```

To check the instances, open the browser and go to each URL, or simply:

```bash
curl <aws_url>
curl <do_url>
```

## Clean up

Destroy the resources.

```bash
terraform destroy
```