#!/usr/bin/env python

from constructs import Construct
from cdk8s import App, Chart
from imports import k8s


class MyChart(Chart):
    def __init__(self, scope: Construct, id: str):
        super().__init__(scope, id)

    def create_env_from_dictionary(self, dictionary):
        return [k8s.EnvVar(name=key, value=value) for key, value in dictionary.items()]

    def create_deployment(self, num_replica, label_dictionary, name, image, port, memory="1000Mi", envs={}):
        k8s.KubeDeployment(self, f'{name}-deployment',
                           metadata=k8s.ObjectMeta(name=f'{name}-deployment'),
                           spec=k8s.DeploymentSpec(
                               replicas=num_replica,
                               selector=k8s.LabelSelector(match_labels=label_dictionary),
                               template=k8s.PodTemplateSpec(
                                   metadata=k8s.ObjectMeta(labels=label_dictionary),
                                   spec=k8s.PodSpec(
                                       containers=[k8s.Container(
                                           env=self.create_env_from_dictionary(envs),
                                           name=name,
                                           image=image,
                                           resources=k8s.ResourceRequirements(
                                               limits={"memory": k8s.Quantity.from_string(memory)}),
                                           ports=[k8s.ContainerPort(container_port=port)])]
                                   ))))

    def create_service(self, name, label_dictionary, port, type="NodePort"):
        k8s.KubeService(self, f'{name}-service',
                        metadata=k8s.ObjectMeta(name=f'{name}-service'),
                        spec=k8s.ServiceSpec(
                            type=type,
                            ports=[k8s.ServicePort(port=port, target_port=k8s.IntOrString.from_number(port))],
                            selector=label_dictionary))

    def create_ingress(self, name, port, host, path_type="Prefix"):
        k8s.IngressRule(self, host=host,
                        http=k8s.HttpIngressRuleValue([k8s.HttpIngressPath(backend=k8s.IngressBackend("ingress",
                                                                                                      service=k8s.IngressServiceBackend(
                                                                                                          name=f'{name}-service',
                                                                                                          port=k8s.ServiceBackendPort(
                                                                                                              number=port))),
                                                                           path_type=path_type)]))

    def create_service_with_deployment(self, label_dictionary, name, image, port, replicas, host, memory="1000Mi",
                                       envs={}):
        self.create_deployment(replicas, label_dictionary, name, image, port, memory, envs)
        self.create_service(name, label_dictionary, port)
        # self.create_ingress(name, port, host)


app = App()
chart = MyChart(app, "cdk8s")
webservice_label = {"app": "dataorc-project-webserver"}
chart.create_service_with_deployment(webservice_label, "ng-webservice",
                                     "424242444242.dkr.ecr.ap-south-1.amazonaws.com/ng-prod-eks-rds:webserver-v24",
                                     5555,
                                     3, "api.dataorc.in", "1Gi")
frontend_label = {"app": "my-frontend"}
app.synth()
