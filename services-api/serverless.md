# Serverless

To be as portable as possible, even with severless, we use [serverless framework](https://serverless.com/framework/docs/). It allows us to deploy our functions across multiple clouds like AWS, GCP, Azure and IBM OpenWisk. 

**Getting Started with the Serverless Framework**

* Create function

  ```text
  sls create --template aws-python3
  ```

  Code: [https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a](https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a)

* update the `serverless.yml` and install [serverless-python-requirements](https://serverless.com/blog/serverless-python-packaging/)  
  [https://www.npmjs.com/package/serverless-python-requirements](https://www.npmjs.com/package/serverless-python-requirements)  
  [https://serverless.com/blog/flask-python-rest-api-serverless-lambda-dynamodb/](https://serverless.com/blog/flask-python-rest-api-serverless-lambda-dynamodb/)

  Code: [https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa](https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa)

### Create a REST API function

* configure the function in `serverless.yml`
* create the function in `handler.py`
  * also install boto3 to access dynamodb
* test the function locally

#### Install a python dependency

```python
pip install boto3
```

#### Store a reference to my dependencies

```python
pip freeze > requirements.txt
```

#### Optional: Re-install the dependencies from requirements.txt

```python
pip install -r requirements.txt
```

#### Implement the function

Code: [https://github.com/denseidel/apis-api/commit/92b72ee086c64f2aee768fa4fa1e32134c6bf2eb](https://github.com/denseidel/apis-api/commit/92b72ee086c64f2aee768fa4fa1e32134c6bf2eb)

#### Test the function locally

```text
sls invoke local --function create_api --path tests/create-api.json
```

todo unit tests: when to use what \(for small functions\) the function test should be ok \(how to run them best in the pipeline? bash script? python framework? node framework \(check how the serverless stack test node functions\)?

#### Deploy the function

```text
sls deploy
```

![](../.gitbook/assets/deployment.png)

The deployment takes very long. I have to see how to optimize this.

#### Test the deployed function

You can use the endpoint endpoint and use Postman to make a "real world" request: ![](../.gitbook/assets/test-with-postman.png)

Or you can use the CLI and use:

```text
sls invoke -f create_api --path tests/create-api.json
```

![](../.gitbook/assets/test-with-cli-at-runtime.png)

### More

* {% embed data="{\"url\":\"https://github.com/serverless/examples\",\"type\":\"link\",\"title\":\"serverless/examples\",\"description\":\"Serverless Examples – A collection of boilerplates and examples of serverless architectures built with the Serverless Framework and AWS Lambda\",\"icon\":{\"type\":\"icon\",\"url\":\"https://github.com/fluidicon.png\",\"aspectRatio\":0},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://avatars3.githubusercontent.com/u/13742415?v=4&s=400\",\"width\":400,\"height\":400,\"aspectRatio\":1}}" %}



## Testing - Serverless Stack Example

I implemented the [serverless-stack.com](https://serverless-stack.com) app for training purposes.

### Prerequesits

* Signup for an AWS account
* Create an IAM role with \(Programmatic access and admin rights\): this is used for the AWS CLI and the serverless framework. 
* Install AWS CLI 

```bash
sudo pip install awscli
#use the access key id and secret access ky as describe above
aws configure
```

### Admin Tasks

1. Create DynamoDB _table name_ `notes` and _Primary key_ with Partition key `userId` and sort key `noteId` and the default created new _IAM Role_ `DynamoDBAutoscaleRole`.
2. Create S3 Bucket with _bucket name_ `your-globally-unique-bucketname` \(e.g. `notes-app-uploads-ds1`\) and _region_ `eu-central-1` and enable CORS by updating the policy under permissions to 

```text
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

### Config - Dummy Data

```text
# create user
aws cognito-idp sign-up --region eu-central-1 --client-id YOUR_CLIENTID --username admin@yourmail.com --password passw0rD
# verfiy user
aws cognito-idp admin-confirm-sign-up --region eu-central-1 --user-pool-id YOUR_USERPOOL_ID --username admin@yourmail.com
```

### Install Serverless

```text
npm install serverless -g
```

### Setup API Backend

Source: [https://serverlesscode.com/post/python-3-on-serverless-framework/](https://serverlesscode.com/post/python-3-on-serverless-framework/)

```text
mkdir notes-app-api
cd notes-app-api
sls create --template aws-python3
```

## Usage

### Create virtual env local, activate and deactivate

```text
#http://sourabhbajaj.com/mac-setup/Python/virtualenv.html
virtualenv venv
source venv/bin/activate
deactivate
```

### Install a python dependency

```python
pip install boto3 requests
```

### Store a reference to my dependencies

```python
pip freeze > requirements.txt
```

### Re-install the dependencies from requirements.txt

pip install -r requirements.txt

### Test locally

```text
sls invoke local --function create --path mocks/create-event.json

sls invoke local -f hello
```

### Run tests

```python
python -m unittest discover -s tests
```

## Deployment

### Deploy  project

```bash
sls deploy
```

### Deploy single function

```text
sls deploy function --function hello
```

### Compile non-pure Python modules \(e.g. C?\)

To compile non-pure Python modules, install [Docker](https://docs.docker.com/engine/installation/) and the [Lambda Docker Image](https://github.com/lambci/docker-lambda). Enable **dockerizePip** in **serverless.yml** and `serverless deploy` again.

```text
# enable dockerize Pip
custom:
  pythonRequirements:
    dockerizePip: true
```

## Sources:

* [https://github.com/serverless/examples/tree/master/aws-python-pynamodb-s3-sigurl](https://github.com/serverless/examples/tree/master/aws-python-pynamodb-s3-sigurl) 
* [https://github.com/AnomalyInnovations/serverless-python-starter](https://github.com/AnomalyInnovations/serverless-python-starter)
* [https://serverlesscode.com/post/python-3-on-serverless-framework/](https://serverlesscode.com/post/python-3-on-serverless-framework/)

## 

