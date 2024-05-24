provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region

    default_tags {
        tags = {
            author = "John Doe"
            version = "1.0.0"
        }
    }
}