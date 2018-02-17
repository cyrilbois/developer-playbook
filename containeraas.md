# The platform provides the tools to increase productivity 



# 

# Container-aaS

Serverless increases the efficiency of your implementation. But at the same time you bind yourself very tightly to a special vendor like Amazon with AWS Lambda. Another Option is to use a multi cloud apporach and use Containers as your abstraction layer - Lambdas also use containers themselves. Downside you don't have the you pay only what you use and you miss the non functional features the platform provides like monitoring, routing ... This is where service meshs like Istio come into play.

## When to use serverless and when to use containers service meshs?

* [https://serverless.com/blog/serverless-faas-vs-containers/](https://serverless.com/blog/serverless-faas-vs-containers/)
* [http://rancher.com/containers-vs-serverless-computing/](http://rancher.com/containers-vs-serverless-computing/)

## Can you integrate serverless with a service mesh and when to do it?

* [https://medium.com/@jeffzzq/how-to-integrate-an-aws-lambda-function-into-your-kubernetes-service-mesh-5d665f351675](https://medium.com/@jeffzzq/how-to-integrate-an-aws-lambda-function-into-your-kubernetes-service-mesh-5d665f351675)

## Basics - Containers, Kubernetes and Service Meshs

### What is Kubernetes and why is it important?

* Sources:

  * [https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)

  * [https://de.slideshare.net/InfoQ/building-a-microservices-platform-with-kubernetes](https://de.slideshare.net/InfoQ/building-a-microservices-platform-with-kubernetes)

* Advantages:

  * lighweight \(compared to VMs\)

  * reliable and reporducable

  * production read \( scalable ...\)

  * "simple" \(routes, services, ...\)

  * vendor independent \(compared to serverless\) and multi cloud ready

Should you run your own cluster? But \(my experience is\) maintaining and setting up a kuebrnetes cluster is hard \(believe me!\) - there are now many great fully manged offerings:

* Openshift
* AWS EKS
* IBM ?
* Service Mesh and Istio
* In late October, Microsoft released the public preview of [Managed Kubernetes for Azure Container Service \(AKS\)](https://azure.microsoft.com/en-us/blog/introducing-azure-container-service-aks-managed-kubernetes-and-azure-container-registry-geo-replication/)

* In November [Google officially renamed](https://cloudplatform.googleblog.com/2017/11/introducing-Certified-Kubernetes-and-Google-Kubernetes-Engine.html) its Google Container Engine to Google Kubernetes Engine.

* Most recently, at AWS re:Invent 2017, Amazon announced its own manged version of Kubernetes [Amazon Elastic Container Service for Kubernetes \(Amazon EKS\)](https://aws.amazon.com/eks/)

* Joyent Kubernetes

### What is Istio?

* Source:

  * [https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/](https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/) \(Udemy Course Istio\)
  * Istio Introduction: 
    * [https://www.youtube.com/watch?v=muoCgHkkPx](https://www.youtube.com/watch?v=muoCgHkkPxo)
    * [https://istio.io/docs/concepts/what-is-istio/overview.html](https://istio.io/docs/concepts/what-is-istio/overview.html)

* Improve development time \(library vs sidecar\)

* improve plattform \(tracing, a/b testing, dashboarding, service graph\)

* ... without changing the code!

## Tutorial

### Setup Local Development environment Minishift

Start minikube \[[Source](https://kubernetes.io/docs/getting-started-guides/minikube/)\]

```
minikube start --memory 4096
```

Setup [Helm](https://docs.helm.sh/) and tiller \[[Source](https://docs.helm.sh/using_helm/#quickstart)\] and Istio \[[Source](https://istio.io/docs/setup/kubernetes/quick-start.html)\] /** helm install currently not working check back in a few weeks.**

```
#find the locally configure cluster where tiller will be installed by helm
kubectl config current-context

#install helm on client / ci/cd pipeline
brew install kubernetes-helm

#https://github.com/istio/istio/tree/master/install/kubernetes/helm/istio
git clone https://github.com/istio/istio.git
cd istio
kubectl create -f install/kubernetes/helm/helm-service-account.yaml

# for production secure helm https://docs.helm.sh/using_helm/#securing-your-helm-installation
helm init \ 
--tiller-tls \ 
--tiller-tls-verify \ 
--tiller-tls-ca-cert=ca.pem \ 
--tiller-tls-cert=cert.pem \ 
--tiller-tls-key=key.pem \ 
--service-account=tiller

helm install install/kubernetes/helm/istio --name istio
```

Install

```
curl -L https://git.io/getLatestIstio | sh -
export PATH="$PATH:/Users/den/repo/istio-0.5.0/bin"
cd istio-0.5.0
kubectl apply -f install/kubernetes/istio.yaml
kubectl apply -f install/kubernetes/istio-auth.yaml
kubectl apply \
  -f install/kubernetes/addons/prometheus.yaml \
  -f install/kubernetes/addons/grafana.yaml \
  -f install/kubernetes/addons/servicegraph.yaml \
  -f install/kubernetes/addons/zipkin.yaml

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=d10l.de"
kubectl create -n istio-system secret tls istio-ingress-certs --key /tmp/tls.key --cert /tmp/tls.crt

#get external ip
kubectl get svc -n istio-system
minikube ip
export GATEWAY_URL=$(kubectl get po -l istio=ingress -n istio-system -o 'jsonpath={.items[0].status.hostIP}'):$(kubectl get svc istio-ingress -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
Deploy app
kubectl apply -f <(istioctl kube-inject -f samples/bookinfo/kube/bookinfo.yaml)
kubectl get services
```

Use minikube's built-in docker daemon:

```
eval $(minikube docker-env)
docker ps
```

Create Dockerfile

Build the dockerfile \([tagging](http://container-solutions.com/tagging-docker-images-the-right-way/)\).

```
docker build -t products:1.0.0 .
```

Create Env variables: [https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)

Create secrets: [https://kubernetes.io/docs/concepts/configuration/secret/](https://kubernetes.io/docs/concepts/configuration/secret/)

```
kubectl create secret generic gcloud-cred --from-file=/Users/den/.config/keys/marketplaceapp.json
```

Deploy

```
kubectl apply -f <(istioctl kube-inject -f ./deployment.yaml)
```

Set it up \(you should do this with [DevSecOps ](/devsecops.md)in Mind \(Automation is everything!\):

[https://www.joyent.com/blog/kubernetes-the-easy-way](https://www.joyent.com/blog/kubernetes-the-easy-way)

[https://www.terraform.io/docs/providers/kubernetes/guides/getting-started.html](https://www.terraform.io/docs/providers/kubernetes/guides/getting-started.html) ?

Register with [Google Cloud Platform](https://cloud.google.com/?hl=de)

Setup SDK locally and in Pipeline

Install Google Cloud SDK \(MacOS\)

[https://cloud.google.com/sdk/docs/quickstart-macos](https://cloud.google.com/sdk/docs/quickstart-macos)

```
brew cask install google-cloud-sdk
```

Install Istio: [https://istio.io/docs/setup/kubernetes/quick-start.html](https://istio.io/docs/setup/kubernetes/quick-start.html)

```
#Retrieve your credentials for kubectl (replace <cluster-name> with the name of the cluster you want to use, and <zone> with the zone where that cluster is located):
gcloud container clusters get-credentials <cluster-name> --zone <zone> --project <project-name>
Grant cluster admin permissions to the current user (admin permissions are required to create the necessary RBAC rules for Istio):
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)
#download istio
curl -L https://git.io/getLatestIstio | sh -
# go to folder
cd istio-0.5.0
# add istiocrl
export PATH=$PWD/bin:$PATH
#Install Istio and enable mutual TLS authentication between sidecars.:
kubectl apply -f install/kubernetes/istio-auth.yaml
# Optional: If your cluster has Kubernetes version 1.9 or greater, and you wish to enable automatic proxy injection, install the sidecar injector webhook using the instructions at (/docs/setup/kubernetes/sidecar-injection.html#automatic-sidecar-injection).

#Verify
kubectl get svc -n istio-system
kubectl get pods -n istio-system

#create/update the namespace for my application with istio enabled
kubectl label namespace <namespace> istio-injection=enabled
# isnstall BookInfo Sample https://istio.io/docs/guides/bookinfo.html
kubectl create -n <namspace> -f <your-app-spec>.yaml
```

Access the non exposed components:

```
kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=zipkin -o jsonpath='{.items[0].metadata.name}') \
  9411:9411 &

kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') \
  3000:3000 &

kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') \
  8088:8088 &

kubectl -n istio-system port-forward \
  $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') \
  9090:9090 &

kubectl proxy (8080/ui -> management ui)
```

To enable TLS create certficate and deploy it as a secret and add the following to the ingress config \([https://istio.io/docs/tasks/traffic-management/ingress.html\](https://istio.io/docs/tasks/traffic-management/ingress.html%29\)

```
---
###########################################################################
# Ingress resource (gateway)
##########################################################################
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  ...
spec:
  tls:
    - secretName: istio-ingress-certs # currently ignored
  rules:
  - ...

---
```

Add your own domain to the static ip address of the cluster: [https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip](https://cloud.google.com/kubernetes-engine/docs/tutorials/configuring-domain-name-static-ip)

Find your static IP address:

```
kubectl get ingress -o wide
```

Setup your DNS \(with Route53\) [https://serverless-stack.com/chapters/setup-your-domain-with-cloudfront.html](https://serverless-stack.com/chapters/setup-your-domain-with-cloudfront.html)

Remove untagged images and stopped containers [http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html](http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html)

```
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
```

Small images [https://nickjanetakis.com/blog/alpine-based-docker-images-make-a-difference-in-real-world-apps](https://nickjanetakis.com/blog/alpine-based-docker-images-make-a-difference-in-real-world-apps)

testing with postman and different environments: [https://www.getpostman.com/docs/postman/environments\_and\_globals/variables](https://www.getpostman.com/docs/postman/environments_and_globals/variables)

Egress Rules currently don't work well with HTTPS [https://istio.io/blog/2018/egress-https.html](https://istio.io/blog/2018/egress-https.html) so better enable direct connection: [https://istio.io/docs/tasks/traffic-management/egress.html](https://istio.io/docs/tasks/traffic-management/egress.html)

```
# minikube
kubectl apply -f <(istioctl kube-inject -f ./deployment.yaml --includeIPRanges=10.0.0.1/24)
#for gke check https://istio.io/docs/tasks/traffic-management/egress.html
gcloud container clusters describe marketplace-istio --zone=us-east1-b | grep -e clusterIpv4Cidr -e servicesIpv4Cidr
kubectl apply -f <(istioctl kube-inject -f ./deployment.yaml --includeIPRanges=10.12.0.0/14,10.15.240.0/20)
```

Mount Containers locally: [https://docs.docker.com/storage/bind-mounts/\#start-a-container-with-a-bind-mount](https://docs.docker.com/storage/bind-mounts/#start-a-container-with-a-bind-mount)

Save docker image in docker hub to use it in kubernetes cluster

```
docker login
docker tag products:1.2.0 dennisseidel/products:1.2.0
docker push dennisseidel/products:1.2.0
```

and add it to the deloyment config

create the secret with

```
kubectl create secret generic gcloud-cred --from-file=/Users/den/.config/keys/marketplaceapp.json
```



