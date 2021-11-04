output "public_subnet_cidrs" {
  value = module.dynamic_subnets.public_subnet_cidrs
  description = "Public subnet CIDRs"
}

output "private_subnet_cidrs" {
  value = module.dynamic_subnets.private_subnet_cidrs
  description = "Private subnet CIDRs"
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
  description = "VPC ID"
}

output "eks_cluster_security_group_id" {
  description = "ID of the EKS cluster Security Group"
  value = module.eks_cluster.security_group_id
}

output "eks_cluster_security_group_arn" {
  description = "ARN of the EKS cluster Security Group"
  value = module.eks_cluster.security_group_arn
}

output "eks_cluster_security_group_name" {
  description = "Name of the EKS cluster Security Group"
  value = module.eks_cluster.security_group_name
}

output "eks_cluster_id" {
  description = "The name of the cluster"
  value = module.eks_cluster.eks_cluster_id
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value = module.eks_cluster.eks_cluster_arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value = module.eks_cluster.eks_cluster_endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes server version of the cluster"
  value = module.eks_cluster.eks_cluster_version
}

output "eks_cluster_identity_oidc_issuer" {
  description = "The OIDC Identity issuer for the cluster"
  value = module.eks_cluster.eks_cluster_identity_oidc_issuer
}

output "eks_cluster_managed_security_group_id" {
  description = "Security Group ID that was created by EKS for the cluster. EKS creates a Security Group and applies it to ENI that is attached to EKS Control Plane master nodes and to any managed workloads"
  value = module.eks_cluster.eks_cluster_managed_security_group_id
}

output "db_instance_id" {
  value       = module.rds_instance.instance_id
  description = "ID of the instance"
}

output "db_instance_address" {
  value       = module.rds_instance.instance_address
  description = "Address of the instance"
}

output "db_instance_endpoint" {
  value       = module.rds_instance.instance_endpoint
  description = "DNS Endpoint of the instance"
}

output "db_subnet_group_id" {
  value       = module.rds_instance.subnet_group_id
  description = "ID of the Subnet Group"
}

output "db_security_group_id" {
  value       = module.rds_instance.security_group_id
  description = "ID of the Security Group"
}

output "db_parameter_group_id" {
  value       = module.rds_instance.parameter_group_id
  description = "ID of the Parameter Group"
}

output "db_option_group_id" {
  value       = module.rds_instance.option_group_id
  description = "ID of the Option Group"
}
