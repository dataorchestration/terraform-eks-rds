#network
namespace = "ng"
name = "dataorc-project"
stage = "prod"
region = "ap-south-1"
vpc_cidr_block = "10.0.0.0/16"
# database settting
database_name = "database_name"
database_user = "database_user"
database_password = "database_password!"
database_port = "5432"
multi_az = "false"
storage_type = "gp2"
allocated_storage = "50"
storage_encrypted = true
engine = "postgres"
engine_version = "11.11"
major_engine_version = "11"
instance_class = "db.m5.large"
#kubernetes settings
cluster_name = "cluster_name-eks-cluster"
max_size_1 = 2
max_size_2 = 2
min_size_1 = 2
min_size_2 = 2
wait_for_capacity_timeout = 0
autoscaling_policies_enabled = true
cpu_utilization_high_threshold_percent = 70
cpu_utilization_low_threshold_percent = 40
worker_pool_1_instance_type = "m5.large"
worker_pool_2_instance_type = "m5.large"
kubernetes_version = "1.19"
apply_immediately = true
availability_zones = [
  "ap-south-1a","ap-south-1b"]
db_subnet_group_name = "db-dataorc-project"
parameter_group_name = "db-group-dataorc-project"
option_group_name = "db-option-group-dataorc-project"
db_parameter_group = "postgres11"
kubernetes_labels_1 = {"node_group_num": "1"}
kubernetes_labels_2 = {"node_group_num": "2"}
disk_size_1 = 50
disk_size_2 = 50