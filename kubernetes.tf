locals {
  # Unfortunately, the `aws_ami` data source attribute `most_recent` (https://github.com/cloudposse/terraform-aws-eks-workers/blob/34a43c25624a6efb3ba5d2770a601d7cb3c0d391/main.tf#L141)
  # does not work as you might expect. If you are not going to use a custom AMI you should
  # use the `eks_worker_ami_name_filter` variable to set the right kubernetes version for EKS workers,
  # otherwise the first version of Kubernetes supported by AWS (v1.11) for EKS workers will be selected, but
  # EKS control plane will ignore it to use one that matches the version specified by the `kubernetes_version` variable.
  eks_worker_ami_name_filter = "amazon-eks-node-${var.kubernetes_version}*"
}


module "eks_node_group_1" {
  source  = "cloudposse/eks-node-group/aws"
  version = "0.24.0"

  subnet_ids        = module.dynamic_subnets.private_subnet_ids
  cluster_name      = module.eks_cluster.eks_cluster_id
  instance_types    = [var.worker_pool_1_instance_type]
  desired_size      = var.min_size_1
  min_size          = var.min_size_1
  max_size          = var.max_size_1
  kubernetes_labels = var.kubernetes_labels_1
  disk_size         = var.disk_size_1

  # Prevent the node groups from being created before the Kubernetes aws-auth ConfigMap
  module_depends_on = module.eks_cluster.kubernetes_config_map_id

  context = module.this.context
}



module "eks_cluster" {
  source = "cloudposse/eks-cluster/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.43.2"
  region = "${var.region}"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.dynamic_subnets.public_subnet_ids

  kubernetes_version = var.kubernetes_version
  oidc_provider_enabled = false

  context = module.this.context
}