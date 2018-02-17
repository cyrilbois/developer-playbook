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

