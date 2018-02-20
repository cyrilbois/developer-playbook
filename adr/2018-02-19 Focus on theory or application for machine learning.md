# _Focus on theory or Application for machine learing_

To add smart features to automate my job I need a data pipeline this could be a vendor neutral which is harder to maintain and takes longer to setup but can be ported to other platforms or a AWS specific setup.

## Considered Alternatives

* AWS Sagemaker
* Kubernetes with Tensorflow

## Decision Outcome

* Chosen Alternative: AWS Sagemaker

* _Currently I need something fast to show results therefor it is easier to use the managed solution from AWS. And I want to learn the business value not the infrastructure setup (In the future I see myself as the user not the maintainer)._

* _I have to monitor AWS EKS and Tensorflow closely and reevaluate in few month if the EKS Tensorflow achieves better results then Sagemaker, currently I do not know if all features are available and what solution will be available inside AZD._

## Pros and Cons of the Alternatives

### AWS Sagemaker

* `+` I can use the Allianz AWS account
* `+` It has lower cost for bootstrapping private projects
* `+` It is tightly integrated with AWS e.g. lex
* `+` It is fast to develop
* `-` Is not the Allianz Strategy, so I cannot use it for work projects
* `-` It is AWS specific \(Lockin\)
* `-` It is not very "evolutionary"
* `-` Only available online
* `-` Google seems to be in the lead with regards to machine learning. 

### Kubernetes + Tensorflow

* `+` It is more portable as I can integrate it wit the complete kubernetes ecosystem (more evolutionary)
* `+` I could use something similar for work projects
* `+` I can develop locally.  
* `-` It is more expensive for private projects
* `-` AWS EKS is not available yet.
* `-` Harder to setup and longer ramp up time
* `-` I have to manage the infrastructure.



