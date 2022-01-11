# Production grade eks + rds terraform module

Prerequisite 
```bash
export AWS_PROFILE=<your profile>
```

configure k8 context
```bash
aws eks --region ap-south-1 update-kubeconfig --name <your cluster name>
```

configure ecr
```bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <your ecr repo>
```


go to dataorc directory  
```bash
export AWS_PROFILE=dataorc
export AWS_REGION=ap-south-1
```

```
terraform apply --var-file=ap-south-1.dataorc.tfvars
```

And you are good with terraform eks and rds. 

All configuration can be controlled via ap-south-1.dataorc.tfvars(which should be env or conditions specific)

# Set context
```bash
aws eks --region us-east-2 update-kubeconfig --name <name of the cluster>
```


```bash
kubectl exec -it ubuntu bash --namespace test 
```
to copy into the pod
```bash
kubectl cp dump_defaultdb_14-11-2021_19_52_25.sql test/ubuntu:/home/dump_defaultdb_14-11-2021_19_52_25.sql
```

to restore the dump
```bash
psql -h ng-prod-eks-rds.example.ap-south-1.rds.amazonaws.com -d defaultdb -U example < dump_defaultdb_14-11-2021_19_52_25.sql
```

ingress deployment
```bash
# we are following https://kubernetes.github.io/ingress-nginx/deploy/#environment-specific-instructions
# download https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.5/deploy/static/provider/aws/deploy-tls-termination.yaml
# edit proxy-real-ip-cidr
terraform output vpc-cidr
#replace at proxy-real-ip-cidr:
# get certificate from
terraform output acm-certificate-for-domain
# replace at service.beta.kubernetes.io/aws-load-balancer-ssl-cert
kubectl apply -f deploy-tls-termination.yaml 
```

# In case error comes 
Troubleshoot
```bash
terraform state rm module.k8-rds.module.eks_cluster.kubernetes_config_map.aws_auth_ignore_changes 
kubectl delete configmap aws-auth --namespace kube-system
terraform apply --var-file=ap-south-1.dataorc.tfvars
```

 
port forwarding
```bash
 kubectl port-forward service/cdk8s-ng-frontend-service-c844cbb8 8080:80
```

dashboard
```bash
#have been following 
# https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
# copy the token
# hit http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
```

#central logging
```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cloudwatch-namespace.yaml
```

create configmap
```bash
export ClusterName=ng-prod-eks-rds-cluster 
export RegionName=ap-south-1
export FluentBitHttpPort='2020'
export FluentBitReadFromHead='On'
[[ ${FluentBitReadFromHead} = 'On' ]] && export FluentBitReadFromTail='Off'|| export FluentBitReadFromTail='On'
[[ -z ${FluentBitHttpPort} ]] && export FluentBitHttpServer='Off' || export FluentBitHttpServer='On'
kubectl create configmap fluent-bit-cluster-info \
--from-literal=cluster.name=${ClusterName} \
--from-literal=http.server=${FluentBitHttpServer} \
--from-literal=http.port=${FluentBitHttpPort} \
--from-literal=read.head=${FluentBitReadFromHead} \
--from-literal=read.tail=${FluentBitReadFromTail} \
--from-literal=logs.region=${RegionName} -n amazon-cloudwatch

```

```bash
kubectl apply -f https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit/fluent-bit.yaml
```

hpa
```bash
 kubectl autoscale deployment ng-frontend-deployment --cpu-percent=70 --min=1 --max=10
 kubectl autoscale deployment ng-metabase-deployment --cpu-percent=70 --min=1 --max=10
 kubectl autoscale deployment ng-webservice-deployment --cpu-percent=70 --min=5 --max=40
```