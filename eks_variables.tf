variable "cluster_name" {
  type = string
  description = "The name of the EKS cluster"
}

variable "max_size_1" {
  type = number
  description = "The maximum size of the autoscale group"
}

variable "min_size_1" {
  type = number
  description = "The minimum size of the autoscale group"
}

variable "max_size_2" {
  type = number
  description = "The maximum size of the autoscale group"
}

variable "min_size_2" {
  type = number
  description = "The minimum size of the autoscale group"
}

variable "health_check_type" {
  type = string
  description = "Controls how health checking is done. Valid values are `EC2` or `ELB`"
}

variable "wait_for_capacity_timeout" {
  type = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to '0' causes Terraform to skip all Capacity Waiting behavior"
}


variable "cpu_utilization_high_threshold_percent" {
  type = number
  description = "The value against which the specified statistic is compared"
}

variable "cpu_utilization_low_threshold_percent" {
  type = number
  description = "The value against which the specified statistic is compared"
}

variable "worker_pool_1_instance_type" {
  type = "string"
}

variable "worker_pool_2_instance_type" {
  type = "string"
}

variable "autoscaling_policies_enabled" {
  type = "string"
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