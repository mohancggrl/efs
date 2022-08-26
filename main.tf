provider "aws" {
#  access_key = var.access_key
#  secret_key = var.secret_key
  alias  = "ohio"
  region = "us-east-2"
}

module "efs" {
  providers = {
    aws = aws.ohio
  }
  source                 = "./modules/efs/"
  subnets                = var.subnets
  efs_kms_key_id         = var.efs_kms_key_id
  create                 = var.create
  performance_mode       = var.performance_mode
  throughput_mode        = var.throughput_mode
  provisioned_throughput = var.provisioned_throughput
  additional_tags        = var.additional_tags
}
