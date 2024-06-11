# provider "aws" {
#   access_key = var.aws_config.access_key
#   secret_key = var.aws_config.secret_key
#   region     = "ap-south-1"

#   default_tags {
#     tags = {
#       author  = "John Doe"
#       version = "1.0.0"
#     }
#   }
# }

provider "aws" {
  access_key = var.aws_config.access_key
  secret_key = var.aws_config.secret_key
  region     = "us-east-1"

  default_tags {
    tags = {
      author  = "John Doe"
      version = "1.0.0"
    }
  }
}

provider "random" {
}