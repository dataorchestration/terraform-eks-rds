provider "aws" {
  profile = "dataorc"
}


module "k8-rds" {
  source = "../"
  context = module.this.context
  #network definitions
  namespace = "${var.namespace}"
  name = "${var.name}"
  stage = "${var.stage}"
  availability_zones = "${var.availability_zones}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
  #rds definitions
  region = "${var.region}"
  database_name = "${var.database_name}"
  database_user = "${var.database_user}"
  database_password = "${var.database_password}"
  database_port = "${var.database_port}"
  multi_az = "${var.multi_az}"
  storage_type = "${var.storage_type}"
  allocated_storage = "${var.allocated_storage}"
  storage_encrypted = "${var.storage_encrypted}"
  engine = "${var.engine}"
  engine_version = "${var.engine_version}"
  instance_class = "${var.instance_class}"
  db_parameter_group = "${var.db_parameter_group}"
  major_engine_version = "${var.major_engine_version}"
  #kubernetes definitions
  cluster_name = "${var.cluster_name}"
  max_size_1 = "${var.max_size_1}"
  min_size_1 = "${var.min_size_1}"
  max_size_2 = "${var.max_size_2}"
  min_size_2 = "${var.min_size_2}"
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"
  autoscaling_policies_enabled = "${var.autoscaling_policies_enabled}"
  cpu_utilization_high_threshold_percent = "${var.cpu_utilization_high_threshold_percent}"
  cpu_utilization_low_threshold_percent = "${var.cpu_utilization_low_threshold_percent}"
  worker_pool_1_instance_type = "${var.worker_pool_1_instance_type}"
  worker_pool_2_instance_type = "${var.worker_pool_2_instance_type}"
  apply_immediately = "${var.apply_immediately}"
  deletion_protection = "${var.deletion_protection}"
  health_check_type = "${var.health_check_type}"
  kubernetes_version = "${var.kubernetes_version}"
  parameter_group_name = "${var.parameter_group_name}"
  disk_size_1 = "${var.disk_size_1}"
  disk_size_2 = "${var.disk_size_2}"
  kubernetes_labels_1 = "${var.kubernetes_labels_1}"
  kubernetes_labels_2 = "${var.kubernetes_labels_2}"
}
