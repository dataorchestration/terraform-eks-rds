module "vpc" {
  source = "cloudposse/vpc/aws"
  version     = "0.28.0"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  cidr_block = var.vpc_cidr_block
}

module "dynamic_subnets" {
  source = "cloudposse/dynamic-subnets/aws"
  version     = "0.39.7"
  namespace          = var.namespace
  stage              = var.stage
  name               = var.name
  availability_zones = var.availability_zones
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.vpc.igw_id
  cidr_block         = var.vpc_cidr_block
}