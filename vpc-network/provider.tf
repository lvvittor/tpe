provider "aws" {
    access_key = var.aws_config.access_key != "" ? var.aws_config.access_key : null
    secret_key = var.aws_config.secret_key != "" ? var.aws_config.secret_key : null
    region = var.region

    default_tags {
        tags = {
            author = "John Doe"
            version = "1.0.0"
        }
    }
}