module "acm" {
  source      = "./acm"
  domain_name = var.domain_name
}

module "s3" {
  source = "./s3"
}

module "cloudfront" {
  source              = "./cloudfront"
  domain_name         = var.domain_name
  s3_origin_id        = module.s3.s3_bucket_id
  s3_domain_name      = module.s3.s3_bucket_domain_name
  s3_bucket_arn       = module.s3.s3_bucket_arn
  acm_certificate_arn = module.acm.acm_certificate_arn
  depends_on          = [module.acm]
}

module "route53" {
  source                  = "./route53"
  domain_name             = var.domain_name
  cloudfront_distribution = module.cloudfront.cloudfront_distribution
  depends_on              = [module.cloudfront]
}

