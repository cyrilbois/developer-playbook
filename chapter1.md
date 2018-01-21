# **Serverless Development Environment for Python and Node Developers \(on OSX\):**

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
npm install -g create-react-app
```

Additional tools to improve the developer experience:

```
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2
brew cask install postman
brew install git
git config --global credential.helper osxkeychain
```

Source: [http://sourabhbajaj.com/mac-setup/Python/virtualenv.html](http://sourabhbajaj.com/mac-setup/Python/virtualenv.html)

# Getting Started with AWS

## Signup for an [AWS](https://aws.amazon.com) account

## Create an IAM role for a serverless-admin 

You don't want to give the serverless-admin access to all feature of aws. Therefore you create a new IAM user that only has the rights a serverless developer needs e.g. access to AWS Lambda, Dynamodb, S3, API Gateway, CloudDeployment and Logs. You use this user for the AWS CLI and the Serverless framework.

1. ### Go to IAM:![](/assets/Screen Shot 2018-01-20 at 22.43.56.png)
2. ### Create new user ![](/assets/create-new-iam-user.png)![](/assets/create-new-iam-user-1.png)![](/assets/creare-iam-role.png)![](/assets/create-iam-role-2.png)![](/assets/serverless-admin-iam-rights.png)![](/assets/import.png)![](/assets/create-iam-role-3.png)![](/assets/create-iam-role-4.png)![](/assets/iam-role-credentials.png)![](/assets/change-iam-user-credentials.png)

* Install AWS CLI 

```bash
sudo pip install awscli
#use the access key id and secret access ky as describe above
aws configure
```



