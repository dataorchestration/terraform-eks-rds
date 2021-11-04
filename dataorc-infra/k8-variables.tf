variable "autoscaling_policies_enabled" {
  default = ""
}
variable "cluster_name" {
  default = ""
}

variable "max_size_1" {
  default = ""
}
variable "min_size_1" {
  default = ""
}
variable "max_size_2" {
  default = ""
}
variable "min_size_2" {
  default = ""
}
variable "wait_for_capacity_timeout" {
  default = ""
}
variable "cpu_utilization_high_threshold_percent" {
  default = ""
}
variable "cpu_utilization_low_threshold_percent" {
  default = ""
}
variable "worker_pool_1_instance_type" {
  default = ""
}
variable "worker_pool_2_instance_type" {
  default = ""
}

variable "health_check_type" {
  default = "EC2"
}

variable "kubernetes_version" {
}

variable "kubernetes_labels_1" {
  type = map(string)
}

variable "kubernetes_labels_2" {
  type = map(string)
}

variable "disk_size_1" {
  type = string
}

variable "disk_size_2" {
  type = string
}