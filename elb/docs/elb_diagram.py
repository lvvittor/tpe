from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2,ECS
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.security import WAF
from diagrams.aws.network import ELB,Route53, CloudFront
from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet, NATGateway, InternetGateway
from diagrams.aws.general import GenericFirewall
from diagrams.aws.network import RouteTable

with Diagram("lb with Ec2 in region and vpc", show=False, direction="TB") as two:
    with Cluster("us-east-1"):
      with Cluster("VPC 10.0.0.0/16"):
          lb = ELB("lb")
          with Cluster("us-east-1a"):
              with Cluster("private_subnet_a"):
                private_subnet_a = PrivateSubnet("\n10.0.1.0/24")
                EC2_1 = EC2("EC2_1")
              with Cluster("public_subnet_a"):
                  public_subnet_a = PublicSubnet("\n10.0.101.0/24")
                  nat_gw_a = NATGateway("NAT gateway")
              private_subnet_a >> nat_gw_a

          with Cluster("us-east-1b"):
              with Cluster("private_subnet_b"):
                  private_subnet_b = PrivateSubnet("\n10.0.2.0/24")
                  EC2_2 = EC2("EC2_2")
              with Cluster("public_subnet_b"):
                  public_subnet_b = PublicSubnet("\n10.0.102.0/24")
                  nat_gw_b = NATGateway("NAT gateway")
              private_subnet_b >> nat_gw_b

          with Cluster("us-east-1c"):
              with Cluster("private_subnet_c"):
                private_subnet_c = PrivateSubnet("\n10.0.3.0/24")
                EC2_3 = EC2("EC2_3")
              with Cluster("public_subnet_c"):
                public_subnet_c = PublicSubnet("\n10.0.103.0/24")
                nat_gw_c = NATGateway("NAT gateway")
              private_subnet_c >> nat_gw_c


          igw = InternetGateway("IGW")

          # Connecting subnets to IGW
          igw >> lb
          svc_group = [EC2_1,
                      EC2_2,
                      EC2_3]

          lb >> svc_group

two
