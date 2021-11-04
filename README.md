
export AWS_PROFILE=dataorc
export AWS_REGION=ap-south-1

#set context
aws eks --region us-east-2 update-kubeconfig --name surgeon-dev-eks-cluster

in case error comes 

Error: configmaps "aws-auth" already exists

```bash
aws eks --region us-east-2 update-kubeconfig --name surgeon-dev-eks-cluster
kubectl delete configmap aws-auth --namespace kube-system
```

```bash
 terraform state rm module.eks_cluster.kubernetes_config_map.aws_auth_ignore_changes
```
