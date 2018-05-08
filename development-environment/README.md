---
description: >-
  Instruction to setup your developer environment for this playbook (working
  with serverless or containers)
---

# Development Environment

## Serverless Development Environment for Python, Javascript/React and Node Developers \(on OSX\):

Install Prerequesits Package Manger Homebrew and CLI Tools:

```text
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Runtime for Javascript and Python:

```text
brew install node python3
```

Install Python and Javascript packages / Dependencies:

```text
pip install virtualenv
npm install -g serverless create-react-app
```

Source: [http://sourabhbajaj.com/mac-setup/Python/virtualenv.html](http://sourabhbajaj.com/mac-setup/Python/virtualenv.html)

Additional tools to improve the developer experience:

```text
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2
brew cask install postman
brew install git
git config --global credential.helper osxkeychain
brew install git-secrets
```

### Setup a template for git to prevent checking in credentials

[Source](https://seesparkbox.com/foundry/git_secrets)

1. Make a directory for the template: 

   ```text
   mkdir ~/.git-template
   ```

2. Install the hooks in the template directory: 

   ```text
   git secrets --install ~/.git-template
   ```

3. Tell git to use it:

   ```text
   git config --global init.templateDir '~/.git-template'
   ```

4. Install AWS patterns globally to be prevented to be checked in to git:

   ```text
   git secrets --register-aws --global
   ```

5. Check the list of secrets `git secrets` will scan for:

   ```text
   git secrets --list
   ```

It should return something like:

```text
ecrets.providers git secrets --aws-provider
secrets.patterns [A-Z0-9]{20}
secrets.patterns ("|')?(AWS|aws|Aws)?_?(SECRET|secret|Secret)?_?(ACCESS|access|Access)?_?(KEY|key|Key)("|')?\s*(:|=>|=)\s*("|')?[A-Za-z0-9/\+=]{40}("|')?
secrets.patterns ("|')?(AWS|aws|Aws)?_?(ACCOUNT|account|Account)_?(ID|id|Id)?("|')?\s*(:|=>|=)\s*("|')?[0-9]{4}\-?[0-9]{4}\-?[0-9]{4}("|')?
secrets.allowed AKIAIOSFODNN7EXAMPLE
secrets.allowed wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

Now every time you run `git init` or `git clone`, your hooks will be copied into the `.git` directory of your freshly created repo. If you don’t want to set the template globally, you can use it as needed with `git init --template ’~/.git-template’`.

That covers new repo creation, and cloning, but we haven’t addressed the problem of _existing repos that weren’t created with the template_. Here we have a couple options:

1. `git init` is a non-destructive operation, so feel free to run it in existing repos. It’s safe, and will retroactively apply the template you specify. OR
2. If you want to go “all in” and ensure that every repo has the proper hooks, here’s a [script](https://gist.github.com/iAmNathanJ/0ae03dcb08ba222d36346b138e83bfdf) that will recursively walk a directory, such as `~/Projects` and run `git secrets --install` in all repos.

### Setup visual studio code

List all my installed extensions:

```text
code --list-extensions
```

```text
HookyQR.beautify
PeterJausovec.vscode-docker
dbaeumer.vscode-eslint
dzannotti.vscode-babel-coloring
formulahendry.auto-close-tag
jebbs.plantuml
magicstack.MagicPython
ms-python.python
msjsdiag.debugger-for-chrome
taichi.react-beautify
tht13.python
tushortz.python-extended-snippets
vscodevim.vim
yzhang.markdown-all-in-one
```

## Getting Started with AWS

### Signup for an [AWS](https://aws.amazon.com) account

### Create an IAM role for a serverless-admin

You don't want to give the serverless-admin access to all feature of aws. Therefore you create a new IAM user that only has the rights a serverless developer needs e.g. access to AWS Lambda, Dynamodb, S3, API Gateway, CloudDeployment and Logs. You use this user for the AWS CLI and the Serverless framework.

1. Go to IAM:![](../.gitbook/assets/screen-shot-2018-01-20-at-22.43.56.png)
2. Create new user: ![](../.gitbook/assets/create-new-iam-user.png)
3. Give it a name and select progammatic access and then next ![](../.gitbook/assets/create-new-iam-user-1.png)
4. Create a group with the permissions for api gateway, aws lambda and deploy  
   ![](../.gitbook/assets/creare-iam-role.png)  
   ![](../.gitbook/assets/create-iam-role-2.png)  
   ![](../.gitbook/assets/create-group.png)  
   ![](../.gitbook/assets/create-iam-role-3.png)

   Overview of the permissions of the user:  
   ![](../.gitbook/assets/serverless-admin-iam-rights.png)

5. Create user \(with group serverless-admin\)![](../.gitbook/assets/create-iam-role-4.png)
6. Save Access key id and secret access key: ![](../.gitbook/assets/iam-role-credentials.png)

Never show this key in public or check it into version control. That's why I now go to user section and delete it and create a new one:  
![](../.gitbook/assets/change-iam-user-credentials.png)

### Install AWS CLI

```bash
sudo pip install awscli
# use the access key id and secret access ky as describe above
aws configure
# AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
# AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
# Default region name [None]: eu-central-1
# Default output format [None]:

# for the man pages do
aws configure help
```

Source: [https://docs.aws.amazon.com/de\_de/cli/latest/userguide/cli-chap-getting-started.html](https://docs.aws.amazon.com/de_de/cli/latest/userguide/cli-chap-getting-started.html)

#### Configure multiple Profiles:

```text
vi ~/.aws/credentials
```

```text
[default]
aws_access_key_id=XXX
aws_secret_access_key=XXX

[serverless-admin]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```

Set the profile:

```text
export AWS_PROFILE=serverless-admin
```

Source: [https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)

### Create project

```text
mkdir apis-api
cd apis-api
git init
git remote add origin https://github.com/denseidel/apis-api.git
npm init
git add .
git commit -am "add package.json and ignore local python files"
git push --set-upstream origin master
```

Code: [https://github.com/denseidel/apis-api/commit/ecc27aaf1f7a714938d99f1b5d656a67376c934b](https://github.com/denseidel/apis-api/commit/85014bb55af8921c3c770fbfe9b56d5722b6c005)

## Documentation

Use Gitbooks:

Install gitbook CLI:

```text
npm install -g gitbook-cli
```

Initialize:

```text
gitbook init
```

Generate output to custom folder

```text
gitbook build . docs
```

## Git Knowledge

* [Git Styleguide](https://udacity.github.io/frontend-nanodegree-styleguide/%20/%20https://udacity.github.io/git-styleguide/)
* [Create new branches](https://github.com/Kunena/Kunena-Forum/wiki/Create-a-new-branch-with-git-and-manage-branches)
* Use branches and if needed [squash all commits related to a single issue into one commit](https://github.com/todotxt/todo.txt-android/wiki/Squash-All-Commits-Related-to-a-Single-Issue-into-a-Single-Commit)
* Merge multiple commits:
  * [https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)
  * [https://robots.thoughtbot.com/autosquashing-git-commits](https://robots.thoughtbot.com/autosquashing-git-commits)
  * [https://www.ralfebert.de/git/rebase/](https://www.ralfebert.de/git/rebase/)
* Modify the last two commits:

```text
git rebase -i HEAD~2
```

Or if they are the last two:

[https://stackoverflow.com/a/24690646/1929968](https://stackoverflow.com/a/24690646/1929968)

```text
git reset --soft "HEAD^"
git commit --amend
git push -f
```

Use git stash to switch change between branches - [https://www.youtube.com/watch?v=KLEDKgMmbBI](https://www.youtube.com/watch?v=KLEDKgMmbBI)

```text
# stash current state
git stash save "Worked on get identities/{identityId}"
# apply current stage (e.g. in other branch) but keep stash
git stash add
# apply current state and delete stash
git stash pop
```

## Development Pipeline:

* gocd: 
  * [https://www.gocd.org/why-gocd/](https://www.gocd.org/why-gocd/)
  * [https://hub.docker.com/r/gocd/gocd-server/](https://hub.docker.com/r/gocd/gocd-server/)
  * [https://hub.docker.com/r/gocd/gocd-agent-alpine-3.5/](https://hub.docker.com/r/gocd/gocd-agent-alpine-3.5/)
  * [https://github.com/kubernetes/charts/tree/master/incubator/gocd](https://github.com/kubernetes/charts/tree/master/incubator/gocd)
  * [https://www.gocd.org/2017/06/26/serverless-architecture-continuous-delivery/](https://www.gocd.org/2017/06/26/serverless-architecture-continuous-delivery/)
* CircleCI Pipeline with ECS: 
  * [http://mherman.org/blog/2017/09/18/on-demand-test-environments-with-docker-and-aws-ecs/](http://mherman.org/blog/2017/09/18/on-demand-test-environments-with-docker-and-aws-ecs/)
  * [http://mherman.org/blog/2017/11/16/docker-on-aws-from-containerization-to-orchestration/](http://mherman.org/blog/2017/11/16/docker-on-aws-from-containerization-to-orchestration/)
  * [https://medium.com/boltops/setting-up-continuous-deployment-to-ecs-on-circleci-e0250bf6c3ad](https://medium.com/boltops/setting-up-continuous-deployment-to-ecs-on-circleci-e0250bf6c3ad)
  * [https://www.reddit.com/r/aws/comments/6vcg18/deploying\_a\_docker\_container\_to\_aws\_ecs\_using\_ecr/](https://www.reddit.com/r/aws/comments/6vcg18/deploying_a_docker_container_to_aws_ecs_using_ecr/)
  * [https://docs.aws.amazon.com/AWSGettingStartedContinuousDeliveryPipeline/latest/GettingStarted/CICD\_Jenkins\_Pipeline.html](https://docs.aws.amazon.com/AWSGettingStartedContinuousDeliveryPipeline/latest/GettingStarted/CICD_Jenkins_Pipeline.html)

Setup CircleCI with Docker, ECS:

1. Go to [https://circleci.com/dashboard](https://circleci.com/dashboard)
2. Add the git repo to it:![](../.gitbook/assets/add-git-repo-to-circleci.png)![](../.gitbook/assets/add-git-repo-to-circleci-2.png)
3. Setup a project as described \(e.g. add the folder `.circleci`with the `config.yml` file\)  

   ![](../.gitbook/assets/setup-circleci-project.png)

### Manual AWS Setup {#manual-aws-setup}

1. EC2 Key Pair: Within the [EC2 Dashboard](https://console.aws.amazon.com/ec2/), click “Key Pairs” on the navigation pane, and then click the “Create Key Pair” button. Name the key`microservicemovies-review`. Save the file in a safe place - i.e., “~/.ssh”. ![](../.gitbook/assets/add-ec2-key-pair.png)
2. ECS Cluster: An [ECS Cluster](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_clusters.html) is just a group of EC2 container instances managed by ECS. To set up, navigate to the [ECS Console](https://console.aws.amazon.com/ecs), and then [select](http://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/getting-started.html#select-region) the region for the Cluster on the right-side of the nav bar.  
   ![](../.gitbook/assets/create-ecs-cluster-1.png)![](../.gitbook/assets/setup-ecs-cluster-2.png)![](../.gitbook/assets/create-ecs-cluster-3.png)![](../.gitbook/assets/create-ecs-cluster-4.png)Navigate to the Cluster once it’s created, and then click the “ECS Instances” tab. From there, click the “Actions” dropdown and select “View Cluster Resources”. **Take note of the VPC and Security Group**:  
   ![](../.gitbook/assets/create-ecs-cluster-5.png)

   **Setup ECR \(Docker Registry\):**

   Within the [ECS Console](https://console.aws.amazon.com/ecs), click “Repositories” on the navigation pane, and then click the “Create repository” button. Add the repositories for all images e.g.:

3. `apimanagement/identities-adapter`
4. `apimanagement/developer-portal`

#### Setup Application Loadbalancers

* Dynamically maps container services to ports
* Distributes traffic evenly across the entire ECS Service
* Runs status health checks against each service
* Allows for zero-downtime deploys

To set up, navigate to the [EC2 Dashboard](https://console.aws.amazon.com/ec2/), update the region \(if necessary\), and then **click “Load Balancers”** in the navigation pane. Click the “Create Load Balancer” button. Select “Application Load Balancer”, and then go through each of the steps to configure the load balancer:

![](../.gitbook/assets/setup-loadbalancer-1.png)![](../.gitbook/assets/setup-loadbalancer-2.png)_Configure Load Balancer_

1. “Name”: `microservicemovies-review`
2. “VPC”: Select the VPC that was just created
3. “Availability Zones”: Select at least two available subnets

![](../.gitbook/assets/configure-loadbalancer-3.png)

\_Configure Security Settings: \_Skip this for now

![](../.gitbook/assets/configure-loadbalancer-4.png)

_Configure Security Groups_: Select the Security Group that was just created

![](../.gitbook/assets/config-loadbalancer-5.png)

_Configure Routing_:

* “Name”:`review-default`
* “Port”:`80`
* “Path”:`/`

![](../.gitbook/assets/conf-loadbalancer-6.png)

_Register Targets_: Do not assign any instances manually since this will be managed by ECS

#### Setup Security Group:

Finally, let’s add some ports to work with to the Security Group. Within the [EC2 Dashboard](https://console.aws.amazon.com/ec2/), click “Security Groups” in the navigation pane, and then** select the Security Group that was just created**. On the **“Inbound Rules”** pane, click the **“Edit”** button and the **“Add another rule button”**:

* Type: `Custom TCP Rule`
* Protocol: `TCP`
* Port Range:`30000-50000`
* Source:`0.0.0.0/0`

![](../.gitbook/assets/add-security-group.png)

Configure Circleci define config.yml

* Chose a build image: [https://circleci.com/docs/2.0/circleci-images/](https://circleci.com/docs/2.0/circleci-images/)
* Setup a remove docker environment to build a docker container: [https://circleci.com/docs/2.0/building-docker-images/](https://circleci.com/docs/2.0/building-docker-images/)

Create deployment script:

./ecs/scripts/setup.py

* check that the cluster exists
* Tag and push images to ECR
  * ./ecs/scripts/ecr.sh
* Get open port for the Listener
* Register Task Definitions
* Create Target Groups
* Add the Listener and Rules
* Create new Services
* run the script in the pipeline

