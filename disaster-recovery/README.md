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

## References

- [AWS Architecture - Disaster Recovery Strategies walkthrough](https://www.youtube.com/watch?v=_4hESnziWIE)
- [Disaster recovery options in the cloud](https://docs.aws.amazon.com/whitepapers/latest/disaster-recovery-workloads-on-aws/disaster-recovery-options-in-the-cloud.html)
- [terraform-aws-route53-recovery-controller](https://github.com/aws-ia/terraform-aws-route53-recovery-controller)
- [Diagram of the architecture](https://d2908q01vomqb2.cloudfront.net/fc074d501302eb2b93e2554793fcaf50b3bf7291/2021/05/13/Figure-2.-Pilot-light-DR-strategy.png)