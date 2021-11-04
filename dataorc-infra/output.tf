output "public_subnet_cidrs" {
  value = module.k8-rds.public_subnet_cidrs
  description = "Public subnet CIDRs"
}

output "private_subnet_cidrs" {
  value = module.k8-rds.private_subnet_cidrs
  description = "Private subnet CIDRs"
}


output "eks_cluster_security_group_id" {
  description = "ID of the EKS cluster Security Group"
  value = module.k8-rds.eks_cluster_security_group_id
}


output "eks_cluster_cluster_id" {
  description = "Name of the EKS cluster cluster id"
  value = module.k8-rds.eks_cluster_id
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value = module.k8-rds.eks_cluster_arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value = module.k8-rds.eks_cluster_endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes server version of the cluster"
  value = module.k8-rds.eks_cluster_version
}

output "db_host_name" {
  value = module.k8-rds.db_instance_address
}

output "db_host_endpoint" {
  value = module.k8-rds.db_instance_endpoint
}