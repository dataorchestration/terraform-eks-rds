variable "availability_zones" {
}

variable "region" {
}

variable "vpc_cidr_block" {
  default = ""
}
variable "database_name" {
  default = ""
}
variable "database_user" {
  default = ""
}
variable "database_password" {
  default = ""
}
variable "database_port" {
  default = ""
}
variable "multi_az" {
  default = ""
}
variable "storage_type" {
  default = ""
}
variable "allocated_storage" {
  default = ""
}
variable "storage_encrypted" {
  default = ""
}
variable "engine" {
  default = ""
}
variable "engine_version" {
  default = ""
}
variable "instance_class" {
  default = ""
}
variable "db_parameter_group" {
  default = ""
}
variable "major_engine_version" {
  default = ""
}
variable "apply_immediately" {
}

variable "deletion_protection" {
  default = "false"
}

//variable "db_subnet_group_name" {
//}
//
variable "parameter_group_name" {
}
//
//variable "option_group_name" {
//}