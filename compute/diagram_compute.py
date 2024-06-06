from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2,ECS

with Diagram("Simple EC2 in region", show=False, direction="TB") as one:
    with Cluster("Region: us-east-1"):
      with Cluster("VPC 10.0.0.0/16"):
        svc_group = [EC2("EC2_1")]

one

with Diagram("Simple droplet with firewall", show=False, direction="TB") as two:
    with Cluster("Region: sfo3"):
      droplet = Droplet("Droplet_1")
      firewall = Firewall("Firewall")

    firewall >> droplet

two
