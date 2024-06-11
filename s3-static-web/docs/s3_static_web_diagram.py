from diagrams import Diagram, Cluster, Edge
from diagrams.aws.storage import S3
from diagrams.aws.network import Route53, CloudFront


with Diagram("Static site in S3, with cloud front and custom domain", show=False, direction="TB") as five:
    with Cluster("AWS") as active_region:
      dns = Route53("itbamafia.com")
      cdn = CloudFront("Cloud Front")
      storage = S3("S3 static web")

    dns >> Edge(label="") >> cdn >> Edge(label="") >> storage

five
