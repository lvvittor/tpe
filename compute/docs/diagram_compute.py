from diagrams import Diagram, Cluster
from diagrams.aws.compute import EC2

with Diagram("Simple EC2 in region", show=False, direction="TB") as one:
    with Cluster("Region: us-east-1"):
      with Cluster("VPC 10.0.0.0/16"):
        svc_group = [EC2("EC2_1")]

one
