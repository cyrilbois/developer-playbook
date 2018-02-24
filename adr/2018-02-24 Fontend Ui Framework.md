# _Frontend Framework vs Ui Framework_

To increase the speed of development I want to us a standard frontend UI Framework. The problem is the ones that have more premade components are harder to debug and customize for the last 10 percent. While the others offer less speed from the beginning and might not even reach the quality level in the end. 


## Considered Alternatives

* [Material-Ui](https://github.com/mui-org/material-ui)
* [Bulma](https://bulma.io/)
* [react-bootstrap](https://react-bootstrap.github.io/)

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
* `-` Hard to fix the last 10 percent

### Bulma

* `+` No external dependencies only css
* `+` I learn the native way of doing things, what I need for customizations anyway
* `-` Slower development time (for 90%) as there are no premade components. 


### react-bootstrap

* `+` Largest community (for bootstrap in general)
* `+` Has premade components
* `+` Has a more tradtional approach then materila-ui
* `-` Not Bootstrap 4 yet, Progress is very slow
* `-` Not fully native and for some components uses jQuery



