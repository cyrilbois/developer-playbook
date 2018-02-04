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



