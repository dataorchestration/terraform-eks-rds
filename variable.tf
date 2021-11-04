variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  type = "string"
}

variable "kubernetes_version" {
  type = "string"
}

variable "region" {
  type = string
  description = "AWS Region"
}

variable "availability_zones" {
  type = list(string)
  description = "List of availability zones"
}


