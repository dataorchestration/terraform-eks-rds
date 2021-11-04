
# Production grade eks + rds terraform module

go to dataorc directory  
```bash
export AWS_PROFILE=dataorc
export AWS_REGION=ap-south-1
```

```
terraform apply --var-file=ap-south-1.dataorc.tfvars
```

And you are good with terraform eks and rds. 

all configuration can be controlled via ap-south-1.dataorc.tfvars(which should be env or conditions specific)

#set context
aws eks --region us-east-2 update-kubeconfig --name <name of the cluster>

in case error comes 

Error: configmaps "aws-auth" already exists

```bash
aws eks --region us-east-2 update-kubeconfig --name surgeon-dev-eks-cluster
kubectl delete configmap aws-auth --namespace kube-system
```

in case error comes while apply like configmaps "aws-auth" is forbidden: User "system:anonymous" cannot get resource "configmaps" in API group
 
```bash
 terraform state rm module.eks_cluster.kubernetes_config_map.aws_auth_ignore_changes
```
