Lambda vs Kubernetes

* [https://medium.com/@jeffzzq/how-to-integrate-an-aws-lambda-function-into-your-kubernetes-service-mesh-5d665f351675](https://medium.com/@jeffzzq/how-to-integrate-an-aws-lambda-function-into-your-kubernetes-service-mesh-5d665f351675)
* Ziele Istio + Kubernetes über multi cloud
* Istio: [https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/](https://programmaticponderings.com/2017/12/22/deploying-and-configuring-istio-on-google-kubernetes-engine-gke/) \(Udemy Course Istio\)
* Istio Introduction: [https://www.youtube.com/watch?v=muoCgHkkPxo](https://www.youtube.com/watch?v=muoCgHkkPxo)
* Kafka on GPC: [https://console.cloud.google.com/launcher/details/bitnami-launchpad/kafka?project=chatbot-157819](https://console.cloud.google.com/launcher/details/bitnami-launchpad/kafka?project=chatbot-157819)

* [https://www.confluent.io/blog/running-kafka-streams-applications-aws/](https://www.confluent.io/blog/running-kafka-streams-applications-aws/)

Containers vs Serverless:

* [https://serverless.com/blog/serverless-faas-vs-containers/](https://serverless.com/blog/serverless-faas-vs-containers/)
* [http://rancher.com/containers-vs-serverless-computing/](http://rancher.com/containers-vs-serverless-computing/)

What is Kubernetes and why is it important?

* [https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)

* [https://de.slideshare.net/InfoQ/building-a-microservices-platform-with-kubernetes](https://de.slideshare.net/InfoQ/building-a-microservices-platform-with-kubernetes)

* lighweight \(compared to VMs\)

* reliable and reporducable

* production read \( scalable ...\)

* "simple" \(routes, services, ...\)

* vendor independent \(compared to serverless\) and multi cloud ready

But \(my experience is\) maintaining and setting up a kuebrnetes cluster is hard \(believe me!\) - there are now many great fully manged offerings:

* Openshift
* AWS EKS
* IBM ?
* Service Mesh and Istio
* In late October, Microsoft released the public preview of [Managed Kubernetes for Azure Container Service \(AKS\)](https://azure.microsoft.com/en-us/blog/introducing-azure-container-service-aks-managed-kubernetes-and-azure-container-registry-geo-replication/)

* In November [Google officially renamed](https://cloudplatform.googleblog.com/2017/11/introducing-Certified-Kubernetes-and-Google-Kubernetes-Engine.html) its Google Container Engine to Google Kubernetes Engine.

* Most recently, at AWS re:Invent 2017, Amazon announced its own manged version of Kubernetes [Amazon Elastic Container Service for Kubernetes \(Amazon EKS\)](https://aws.amazon.com/eks/)

* Joyent Kubernetes

[https://istio.io/docs/concepts/what-is-istio/overview.html](https://istio.io/docs/concepts/what-is-istio/overview.html)

[https://github.com/istio/istio](https://github.com/istio/istio)

What is it?

Why to use it?

[https://istio.io/docs/concepts/what-is-istio/overview.html](https://istio.io/docs/concepts/what-is-istio/overview.html)

* Improve development time \(library vs sidecar\)
* improve plattform \(tracing, a/b testing, dashboarding, service graph\) 
* ... without changing the code! 

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



