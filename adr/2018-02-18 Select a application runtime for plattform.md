# S_elect a application runtime_

To run the applications I need to decide which platform to chose.

## Considered Alternatives

* AWS Lambda
* AWS EKS \(Kubernetes + Helm + Istio\)

## Decision Outcome

* Chosen Alternative: AWS Lamda

* _Currently Istio as well as EKS is still in beta and for private projects AWS Lambda is the more cost efficient version._

* _I have to monitor Istio & AWS EKS closely and reevaluate in few month when the right point in time is to switch to Istio. When I can run us it on AZD account for cost reasons and critical feature are available. Until then I will use AWS Lambda with Connexion and keep the lockin to AWS at a minimum._

## Pros and Cons of the Alternatives

### AWS Lambda

* `+` I can use the Allianz AWS account
* `+` It has lower cost for bootstrapping private projects
* `+` It is tightly integrated with AWS
* `+` It is fast to develop
* `-` Is not the Allianz Strategy, so I cannot use it for work projects
* `-` It is AWS specific \(Lockin\)
* `-` It is not very "evolutionary"
* `-` It misses some logging and routing feature like Istio

### AWS EKS 

* `+` It is more portable as I can integrate it with Istio and the complete kubernetes ecosystem
* `+` I could use something similar for work projects
* `+` I can use plain docker and have a faster local development time. 
* `-` I is more expensive for private projects
* `-` Istio is currently still in development and important features like token validation, helm charts, egress policy is still in beta.
* `-` AWS EKS is not available yet.





