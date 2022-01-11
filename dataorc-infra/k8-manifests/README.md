install for cdk8s



```bash
npm install -g cdk8s-cli
virtualenv --python=$HOME/.pyenv/versions/3.7.4/bin/python3.7 cdk8
pipenv install
mkdir cdk8s
cdk8s init python-app
```

```bash
pip3 install constructs==3.0.4
pip3 install cdk8s~=0.26.0
#have set this since virtualenv was not working
export PIPENV_IGNORE_VIRTUALENVS=1
cdk8s synth &&  kubectl apply -f dist/cdk8s.k8s.yaml

```

rbac for eks
```bash
kubectl apply -f aws-auth.yaml
```

deploy k8 dashboard
```bash
export DASHBOARD_VERSION="v2.0.0"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
kubectl proxy --port=8080 --address=0.0.0.0 --disable-filter=true &
```
