provider "aws" {
  access_key = var.aws_config.access_key
  secret_key = var.aws_config.secret_key
  region     = var.region

  default_tags {
    tags = {
      author  = "John Doe"
      version = "1.0.0"
    }
  }
}

provider "random" {
}