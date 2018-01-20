# Serverless Stack Example

I implemented the [serverless-stack.com](https://serverless-stack.com) app for training purposes. 

## Prerequesits

- Signup for an AWS account
- Create an IAM role with (Programmatic access and admin rights): this is used for the AWS CLI and the serverless framework. 
- Install AWS CLI 

```bash
sudo pip install awscli
#use the access key id and secret access ky as describe above
aws configure
```

## Admin Tasks

1. Create DynamoDB *table name* `notes` and *Primary key* with Partition key `userId` and sort key `noteId` and the default created new *IAM Role* `DynamoDBAutoscaleRole`.
1. Create S3 Bucket with *bucket name* `your-globally-unique-bucketname` (e.g. `notes-app-uploads-ds1`) and *region* `eu-central-1` and enable CORS by updating the policy under permissions to 

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
1. Create User Pool in Cognito with *Pool name* ``notes-user-pool`  and choose username attributes and select email adress or phone numbers and allow email addresses. Finish and *note the Pool ID and Pool ARN*. 
1. Create App clients in the Cognito User Pool with *App client name* `notes-app` and *refresh token expiration* `30` and *Generate client secret* `deselected` and * Enable sign-in API server-based authentication* `selected`. Finish and *note the App client id*.

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
Source: https://serverlesscode.com/post/python-3-on-serverless-framework/
```
mkdir notes-app-api
cd notes-app-api
sls create --template aws-python3
```

#Usage 

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

#Deployment

## Deploy  project
```bash
sls deploy
```

## Deploy single function
```
sls deploy function --function hello
```

## Compile non-pure Python modules (e.g. C?)
To compile non-pure Python modules, install [Docker](https://docs.docker.com/engine/installation/) and the [Lambda Docker Image](https://github.com/lambci/docker-lambda). Enable **dockerizePip** in **serverless.yml** and `serverless deploy` again.

```yml
# enable dockerize Pip
custom:
  pythonRequirements:
    dockerizePip: true
```

# Sources:
- https://github.com/serverless/examples/tree/master/aws-python-pynamodb-s3-sigurl 
- https://github.com/AnomalyInnovations/serverless-python-starter
- https://serverlesscode.com/post/python-3-on-serverless-framework/