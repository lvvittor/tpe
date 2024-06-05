from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2,ECS
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.security import WAF
from diagrams.aws.network import ELB,Route53, CloudFront
from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet, NATGateway, InternetGateway
from diagrams.aws.general import GenericFirewall
from diagrams.aws.network import RouteTable

with Diagram("Pasive and active with failover", show=False, direction="TB") as four:
    with Cluster("us-west-2") as active_region:
      with Cluster("VPC 10.0.0.0/16"):
        igw_active = InternetGateway("IGW")
        with Cluster("us-west-2a"):
            with Cluster("private_subnet_active"):
              private_subnet_active = PrivateSubnet("\n10.0.4.0/24")
              EC2_1 = EC2("EC2_active")
            with Cluster("public_subnet_active"):
              public_subnet_active = PublicSubnet("\n10.0.0.0/24")
              nat_gw_a = NATGateway("NAT gateway")
            private_subnet_active >> nat_gw_a

        # Connecting subnets to IGW
      public_subnet_active >> igw_active

    with Cluster("us-east-1") as passive_region:
        with Cluster("VPC 10.0.0.0/16"):
          igw_passive = InternetGateway("IGW")
          with Cluster("us-east-1a"):
              with Cluster("private_subnet_passive"):
                private_subnet_passive = PrivateSubnet("\n10.0.4.0/24")
                EC2_1 = EC2("EC2_passive")
              with Cluster("public_subnet_passive"):
                public_subnet_passive = PublicSubnet("\n10.0.0.0/24")
                nat_gw_b = NATGateway("NAT gateway")
              private_subnet_passive >> nat_gw_b

          # Connecting subnets to IGW
        public_subnet_passive >> igw_passive

    dns = Route53("aws_route53")

    igw_active >> dns

    igw_passive >> dns

four
