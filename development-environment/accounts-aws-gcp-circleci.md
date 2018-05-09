# Accounts \(AWS, GCP, CircleCI\)

## Getting Started with AWS

### Signup for an [AWS](https://aws.amazon.com) account

### Create an IAM role for a serverless-admin

You don't want to give the serverless-admin access to all feature of aws. Therefore you create a new IAM user that only has the rights a serverless developer needs e.g. access to AWS Lambda, Dynamodb, S3, API Gateway, CloudDeployment and Logs. You use this user for the AWS CLI and the Serverless framework.

#### Go to IAM:

![](../.gitbook/assets/screen-shot-2018-01-20-at-22.43.56%20%281%29.png)

#### Create new user: 

![](../.gitbook/assets/create-new-iam-user%20%282%29.png)

#### Give it a name and select progammatic access and then next 

![](../.gitbook/assets/create-new-iam-user%20%281%29.png)

#### Create a group with the permissions for api gateway, aws lambda and deploy

![](../.gitbook/assets/creare-iam-role%20%283%29.png)

![](../.gitbook/assets/create-iam-role-2.png)

![](../.gitbook/assets/create-group.png)

![](../.gitbook/assets/create-iam-role-3.png)

#### Overview of the permissions of the user:

![](../.gitbook/assets/serverless-admin-iam-rights.png)

#### Create user \(with group serverless-admin\)

![](../.gitbook/assets/create-iam-role-4%20%281%29.png)

#### Save Access key id and secret access key: 

![](../.gitbook/assets/iam-role-credentials%20%281%29.png)

#### Never show this key in public or check it into version control. That's why I now go to user section and delete it and create a new one:

![](../.gitbook/assets/change-iam-user-credentials%20%282%29.png)

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
