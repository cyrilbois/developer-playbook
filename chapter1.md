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

Source: https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html





