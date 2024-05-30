module "active" {
  source     = "./cell"
  aws_config = var.aws_config
  region     = "us-east-1"
  vpc_azs    = ["us-east-1a", "us-east-1b"]
}

module "passive" {
  source     = "./cell"
  aws_config = var.aws_config
  region     = "us-west-1"
  vpc_azs    = ["us-west-1b", "us-west-1c"]
}

