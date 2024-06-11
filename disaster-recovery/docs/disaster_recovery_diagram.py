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
              private_subnet_active_1 = PrivateSubnet("\n10.0.101.0/24")
              EC2_1 = EC2("Autoscaling EC2")
            with Cluster("public_subnet_active"):
              public_subnet_active_1 = PublicSubnet("\n10.0.1.0/24")
              nat_gw_a_1 = NATGateway("NAT gateway")
            private_subnet_active_1 >> nat_gw_a_1

        with Cluster("us-west-2b"):

            with Cluster("private_subnet_active"):
              private_subnet_active_2 = PrivateSubnet("\n10.0.102.0/24")
              EC2_1 = EC2("Autoscaling EC2")
            with Cluster("public_subnet_active"):
              public_subnet_active_2 = PublicSubnet("\n10.0.2.0/24")
              nat_gw_a_2 = NATGateway("NAT gateway")
            private_subnet_active_2 >> nat_gw_a_2



        # Connecting subnets to IGW
      public_subnet_active_1 >> igw_active
      public_subnet_active_2 >> igw_active

    with Cluster("us-east-1") as passive_region:
        with Cluster("VPC 10.0.0.0/16"):
          igw_passive = InternetGateway("IGW")
          with Cluster("us-east-1a"):

              with Cluster("private_subnet_passive"):
                private_subnet_passive_1 = PrivateSubnet("\n10.0.101.0/24")
                EC2_1 = EC2("Autoscaling EC2")
              with Cluster("public_subnet_passive"):
                public_subnet_passive_1 = PublicSubnet("\n10.0.1.0/24")
                nat_gw_b_1 = NATGateway("NAT gateway")
              private_subnet_passive_1 >> nat_gw_b_1

          with Cluster("us-east-1b"):

              with Cluster("private_subnet_passive"):
                private_subnet_passive_2 = PrivateSubnet("\n10.0.102.0/24")
                EC2_1 = EC2("Autoscaling EC2")
              with Cluster("public_subnet_passive"):
                public_subnet_passive_2 = PublicSubnet("\n10.0.2.0/24")
                nat_gw_b_2 = NATGateway("NAT gateway")
              private_subnet_passive_2 >> nat_gw_b_2

          # Connecting subnets to IGW
        public_subnet_passive_1 >> igw_passive
        public_subnet_passive_2 >> igw_passive
    dns = Route53("aws_route53")

    igw_active >> dns

    igw_passive >> dns

four
