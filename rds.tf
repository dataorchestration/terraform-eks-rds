module "rds_instance" {
  source = "cloudposse/rds/aws"
  database_name        = var.database_name
  database_user        = var.database_user
  database_password    = var.database_password
  database_port        = var.database_port
  multi_az             = var.multi_az
  storage_type         = var.storage_type
  allocated_storage    = var.allocated_storage
  storage_encrypted    = var.storage_encrypted
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_parameter_group   = var.db_parameter_group
  publicly_accessible  = var.publicly_accessible
  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.dynamic_subnets.private_subnet_ids
  security_group_ids   = [module.vpc.vpc_default_security_group_id,module.eks_cluster.eks_cluster_managed_security_group_id]
  apply_immediately    = var.apply_immediately
  db_subnet_group_name = var.db_subnet_group_name
  deletion_protection  = var.deletion_protection
//  parameter_group_name = var.parameter_group_name
//  option_group_name    = var.option_group_name
  context = module.this.context

}