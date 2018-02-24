# _Frontend Framework vs Ui Framework_

To increase the speed of development I want to us a standard frontend UI Framework. The problem is the ones that have more premade components are harder to debug and customize for the last 10 percent. While the others offer less speed from the beginning and might not even reach the quality level in the end. 


## Considered Alternatives

* [Material-Ui](https://github.com/mui-org/material-ui)
* Kubernetes with Tensorflow

## Decision Outcome

* Chosen Alternative: AWS Sagemaker

* _Currently I need something fast to show results therefor it is easier to use the managed solution from AWS. And I want to learn the business value not the infrastructure setup (In the future I see myself as the user not the maintainer)._

* _I have to monitor AWS EKS and Tensorflow closely and reevaluate in few month if the EKS Tensorflow achieves better results then Sagemaker, currently I do not know if all features are available and what solution will be available inside AZD._

## Pros and Cons of the Alternatives

### Material-Ui

* `+` It has most stars on github
* `+` Has lots of feature rich component
* `+` Use modern JSS for styling
* `-` Complex to use
* `-` I don't learn the basics

### Kubernetes + Tensorflow

* `+` It is more portable as I can integrate it wit the complete kubernetes ecosystem (more evolutionary)
* `+` I could use something similar for work projects
* `+` I can develop locally.  
* `-` It is more expensive for private projects
* `-` AWS EKS is not available yet.
* `-` Harder to setup and longer ramp up time
* `-` I have to manage the infrastructure.



