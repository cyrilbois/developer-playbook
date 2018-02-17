# Serverless Development Environment for Python, Javascript/React and Node Developers \(on OSX\):

Install Prerequesits Package Manger Homebrew and CLI Tools:

```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Runtime for Javascript and Python:

```
brew install node python3
```

Install Python and Javascript packages / Dependencies:

```
pip install virtualenv
npm install -g serverless create-react-app
```

Source: [http://sourabhbajaj.com/mac-setup/Python/virtualenv.html](http://sourabhbajaj.com/mac-setup/Python/virtualenv.html)

Additional tools to improve the developer experience:

```
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2
brew cask install postman
brew install git
git config --global credential.helper osxkeychain
```

## Setup visual studio code

List all my installed extensions:

```
code --list-extensions
```

```
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

# Getting Started with AWS

## Signup for an [AWS](https://aws.amazon.com) account

## Create an IAM role for a serverless-admin

You don't want to give the serverless-admin access to all feature of aws. Therefore you create a new IAM user that only has the rights a serverless developer needs e.g. access to AWS Lambda, Dynamodb, S3, API Gateway, CloudDeployment and Logs. You use this user for the AWS CLI and the Serverless framework.

1. Go to IAM:![](/assets/Screen Shot 2018-01-20 at 22.43.56.png)

2. Create new user:  
    ![](/assets/create-new-iam-user.png)

3. Give it a name and select progammatic access and then next  
   ![](/assets/create-new-iam-user-1.png)

4. Create a group with the permissions for api gateway, aws lambda and deploy  
   ![](/assets/creare-iam-role.png)  
   ![](/assets/create-iam-role-2.png)  
   ![](/assets/create-group.png)  
   ![](/assets/create-iam-role-3.png)

   Overview of the permissions of the user:  
   ![](/assets/serverless-admin-iam-rights.png)

5. Create user \(with group serverless-admin\)![](/assets/create-iam-role-4.png)

6. Save Access key id and secret access key:  
   ![](/assets/iam-role-credentials.png)

Never show this key in public or check it into version control. That's why I now go to user section and delete it and create a new one:  
![](/assets/change-iam-user-credentials.png)

## Install AWS CLI

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

### Configure multiple Profiles:

```
vi ~/.aws/credentials
```

```
[default]
aws_access_key_id=XXX
aws_secret_access_key=XXX

[serverless-admin]
aws_access_key_id=AKIAI44QH8DHBEXAMPLE
aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
```

Set the profile:

```
export AWS_PROFILE=serverless-admin
```

Source: [https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)

## Create project

```
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

# Documentation

Use Gitbooks:

Install gitbook CLI:

```
npm install -g gitbook-cli
```

Initialize:

```
gitbook init
```

Generate output to custom folder

```
gitbook build . docs
```

# Git Knowledge

Merge multiple commits:

[https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)

[https://robots.thoughtbot.com/autosquashing-git-commits](https://robots.thoughtbot.com/autosquashing-git-commits)

[https://www.ralfebert.de/git/rebase/](https://www.ralfebert.de/git/rebase/)

Modify the last two commits:

```
git rebase -i HEAD~2
```

Or if they are the last two:

[https://stackoverflow.com/a/24690646/1929968](https://stackoverflow.com/a/24690646/1929968)

```
git reset --soft "HEAD^"
git commit --amend
git push -f
```

Create new branches:

[https://github.com/Kunena/Kunena-Forum/wiki/Create-a-new-branch-with-git-and-manage-branches](https://github.com/Kunena/Kunena-Forum/wiki/Create-a-new-branch-with-git-and-manage-branches)

# Testing - Serverless Stack Example

I implemented the [serverless-stack.com](https://serverless-stack.com) app for training purposes.

## Prerequesits

* Signup for an AWS account
* Create an IAM role with \(Programmatic access and admin rights\): this is used for the AWS CLI and the serverless framework. 
* Install AWS CLI 

```bash
sudo pip install awscli
#use the access key id and secret access ky as describe above
aws configure
```

## Admin Tasks

1. Create DynamoDB _table name_ `notes` and _Primary key_ with Partition key `userId` and sort key `noteId` and the default created new _IAM Role_ `DynamoDBAutoscaleRole`.
2. Create S3 Bucket with _bucket name_ `your-globally-unique-bucketname` \(e.g. `notes-app-uploads-ds1`\) and _region_ `eu-central-1` and enable CORS by updating the policy under permissions to 

```
<CORSConfiguration>
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>HEAD</AllowedMethod>
        <MaxAgeSeconds>3000</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```

1. Create User Pool in Cognito with _Pool name_ ```notes-user-pool``  and choose username attributes and select email adress or phone numbers and allow email addresses. Finish and _note the Pool ID and Pool ARN_. 
2. Create App clients in the Cognito User Pool with _App client name_ `notes-app` and _refresh token expiration_ `30` and _Generate client secret_ `deselected` and _ Enable sign-in API server-based authentication_ `selected`. Finish and _note the App client id_.

## Config - Dummy Data

```
# create user
aws cognito-idp sign-up --region eu-central-1 --client-id YOUR_CLIENTID --username admin@yourmail.com --password passw0rD
# verfiy user
aws cognito-idp admin-confirm-sign-up --region eu-central-1 --user-pool-id YOUR_USERPOOL_ID --username admin@yourmail.com
```

## Install Serverless

```
npm install serverless -g
```

## Setup API Backend

Source: [https://serverlesscode.com/post/python-3-on-serverless-framework/](https://serverlesscode.com/post/python-3-on-serverless-framework/)

```
mkdir notes-app-api
cd notes-app-api
sls create --template aws-python3
```

# Usage

## Create virtual env local, activate and deactivate

```
#http://sourabhbajaj.com/mac-setup/Python/virtualenv.html
virtualenv venv
source venv/bin/activate
deactivate
```

## Install a python dependency

```python
pip install boto3 requests
```

## Store a reference to my dependencies

```python
pip freeze > requirements.txt
```

## Re-install the dependencies from requirements.txt

pip install -r requirements.txt

## Test locally

```
sls invoke local --function create --path mocks/create-event.json

sls invoke local -f hello
```

## Run tests

```py
python -m unittest discover -s tests
```

# Deployment

## Deploy  project

```bash
sls deploy
```

## Deploy single function

```
sls deploy function --function hello
```

## Compile non-pure Python modules \(e.g. C?\)

To compile non-pure Python modules, install [Docker](https://docs.docker.com/engine/installation/) and the [Lambda Docker Image](https://github.com/lambci/docker-lambda). Enable **dockerizePip** in **serverless.yml** and `serverless deploy` again.

```yml
# enable dockerize Pip
custom:
  pythonRequirements:
    dockerizePip: true
```

# Sources:

* [https://github.com/serverless/examples/tree/master/aws-python-pynamodb-s3-sigurl](https://github.com/serverless/examples/tree/master/aws-python-pynamodb-s3-sigurl) 
* [https://github.com/AnomalyInnovations/serverless-python-starter](https://github.com/AnomalyInnovations/serverless-python-starter)
* [https://serverlesscode.com/post/python-3-on-serverless-framework/](https://serverlesscode.com/post/python-3-on-serverless-framework/)



