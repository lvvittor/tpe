module "aws" {
    source = "./aws"
    access_key = var.aws_config.access_key
    secret_key = var.aws_config.secret_key
}

module "do" {
    source = "./do"
    do_token = var.do_config.do_token
    ssh_fingerprint = var.do_config.ssh_fingerprint
    ssh_private_key_path = var.do_config.ssh_private_key_path
}