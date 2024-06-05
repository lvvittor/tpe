from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2,ECS
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.security import WAF
from diagrams.aws.network import ELB,Route53, CloudFront
from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet, NATGateway, InternetGateway
from diagrams.aws.general import GenericFirewall
from diagrams.aws.network import RouteTable


with Diagram("Static site in S3, with cloud front and custom domain", show=False, direction="TB") as five:
    with Cluster("AWS") as active_region:
      dns = Route53("itbamafia.com")
      cdn = CloudFront("Cloud Front")
      storage = S3("S3 static web")

    dns >> Edge(label="") >> cdn >> Edge(label="") >> storage

five
