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

cloudfront_domain_name = "d3fcbatzkd3n7i.cloudfront.net"
s3_bucket_endpoint = "s3-static-web-jyyaaq5x.s3-website.ap-south-1.amazonaws.com"
```

Now you can go to the `cloudfront_domain_name` and see the static website redirects to `/index.html`, change the URL to something like `/upppps` to see the error page.


## Clean up

Destroy the resources.

```bash
terraform destroy
```