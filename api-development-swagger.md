# Service/API

The core business functions are develop in services either using microservices or event driven actors.Theu can be implemented on the [platform ](/containeraas.md)either as _serverless_ or _containers_.

#### Architectural Decisions

1. Languages: Python/NodeJS

## Stack

1. Understand the domain - [create a lean diagram](/architecture.md) with a domain diagram \(events, commands, actors, aggregates\), interaction diagram and a first deployment diagram, \(squnce diagram? not at this stage right?\).
2. Setup the project
3. Decide if it is [serverless or container use case.](/containeraas.md)
4. Design the API / Event in Swagger.
5. Implement the first mock. 
6. Implement the API or Event Actor. 

---

# Setup the project

* Create [new github repo](https://github.com/new):  
  ![](/assets/create-github-repo-for-project.png)

* Clone repo:

  ```
  git clone https://github.com/denseidel/consumer-marketplace-service.git
  ```

* Start a virtual environment

  ```
  virtualenv venv --python=python3
  source venv/bin/activate
  # install pylint 
  pip install pylint
  ```

  If you use visual studio code do this first in your terminal window and then open the folder again with `code .`.


# Developer a docker microservice

1. Check that you have have a local docker environment in [Plattform](/containeraas.md) -> Setup Docker Environment.
1. Create Dockerfile ([Code](https://github.com/denseidel/consumer-marketplace-service/commit/405511051d1f603a92c024b4a23bf80d279480e7)). **TODO create it for the mock** 
1. Create docker-compose file
  * [Environment Variables to connect to AWS](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
1. Implement Frontend against mocks
1. Update Dockerfile to production config
1. Implement API (including DB, ...)





  




# Getting Started with the Serverless Framework

* Create function

  ```
  sls create --template aws-python3
  ```

  Code: [https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a](https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a)

* update the `serverless.yml` and install [serverless-python-requirements](https://serverless.com/blog/serverless-python-packaging/)  
  [https://www.npmjs.com/package/serverless-python-requirements](https://www.npmjs.com/package/serverless-python-requirements)  
  [https://serverless.com/blog/flask-python-rest-api-serverless-lambda-dynamodb/](https://serverless.com/blog/flask-python-rest-api-serverless-lambda-dynamodb/)

  Code: [https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa](https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa)

## Create a REST API function

* configure the function in `serverless.yml`
* create the function in `handler.py`
  * also install boto3 to access dynamodb
* test the function locally

### Install a python dependency

```python
pip install boto3
```

### Store a reference to my dependencies

```python
pip freeze > requirements.txt
```

### Optional: Re-install the dependencies from requirements.txt

```python
pip install -r requirements.txt
```

### Implement the function

Code: [https://github.com/denseidel/apis-api/commit/92b72ee086c64f2aee768fa4fa1e32134c6bf2eb](https://github.com/denseidel/apis-api/commit/92b72ee086c64f2aee768fa4fa1e32134c6bf2eb)

### Test the function locally

```
sls invoke local --function create_api --path tests/create-api.json
```

todo unit tests: when to use what \(for small functions\) the function test should be ok \(how to run them best in the pipeline? bash script? python framework? node framework \(check how the serverless stack test node functions\)?

### Deploy the function

```
sls deploy
```

![](/assets/deployment.png)

The deployment takes very long. I have to see how to optimize this.

### Test the deployed function

You can use the endpoint endpoint and use Postman to make a "real world" request: ![](/assets/test-with-postman.png)

Or you can use the CLI and use:

```
sls invoke -f create_api --path tests/create-api.json
```

![](/assets/test-with-cli-at-runtime.png)

## More

* [https://github.com/serverless/examples](https://github.com/serverless/examples)

# 

# develop a api \(api first\) with swagger, python and the serverless framework

Principle of Good API Development vs Bad API Development

* Bad API Developers start by write code and tackle the technical challanges. Good API designer enable fast feedback by designing the interfaces showing it to the \(API\) customer and itterate on that. 
* Bad API Developer design for days and weeks until "perfection". Good API Developers find the the point of minimal agreement with the customer and then write the code, find new challanges based on the technology and itterated again with the customer over the best solution. 
* Bad API Developer on initial implementation speed, Good API Developer focus on reduced cycle times \(with api customers and technology\).
  * [https://www.youtube.com/watch?v=SEQeovx5z\_A](https://www.youtube.com/watch?v=SEQeovx5z_A)
  * Use API First Frameworks: [https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto](https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto)

Benefits API First:

![](/assets/advantages-of-api-first.png)

[https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto\#python-flask-connexion](https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto#python-flask-connexion)

[http://connexion.readthedocs.io/en/latest/cli.html](http://connexion.readthedocs.io/en/latest/cli.html)

[https://blog.runscope.com/posts/openapi-swagger-resource-list-for-api-developers](https://blog.runscope.com/posts/openapi-swagger-resource-list-for-api-developers)

[https://medium.com/ibm-data-science-experience/deploy-your-python-functions-as-a-rest-api-811981ec7ec5](https://medium.com/ibm-data-science-experience/deploy-your-python-functions-as-a-rest-api-811981ec7ec5)

[https://github.com/zalando/connexion](https://github.com/zalando/connexion)

[http://michal.karzynski.pl/blog/2016/06/19/building-beautiful-restful-apis-using-flask-swagger-ui-flask-restplus/](http://michal.karzynski.pl/blog/2016/06/19/building-beautiful-restful-apis-using-flask-swagger-ui-flask-restplus/)

[https://cidrblock.github.io/zero-to-api-in-4-minutes.html](https://cidrblock.github.io/zero-to-api-in-4-minutes.html)

Beispiel: [https://github.com/hjacobs/connexion-example](https://github.com/hjacobs/connexion-example)

## Develop API First in Python

Check how to get started with Python: [Serverless Framework \(Python\)](/serverless-framework.md)

Get started with Connextion: [http://connexion.readthedocs.io/en/latest/quickstart.html](http://connexion.readthedocs.io/en/latest/quickstart.html)

[https://github.com/zalando/connexion](https://github.com/zalando/connexion)

[https://github.com/hjacobs/connexion-example](https://github.com/hjacobs/connexion-example)

[https://cidrblock.github.io/zero-to-api-in-4-minutes.html](https://cidrblock.github.io/zero-to-api-in-4-minutes.html)

[https://github.com/ssola/python-flask-microservice/blob/master/api/room.py](https://github.com/ssola/python-flask-microservice/blob/master/api/room.py)

[https://medium.com/@ssola/building-microservices-with-python-part-i-5240a8dcc2fb](https://medium.com/@ssola/building-microservices-with-python-part-i-5240a8dcc2fb)

[http://coderobot.downley.net/swagger-driven-testing-in-python.html](http://coderobot.downley.net/swagger-driven-testing-in-python.html)

[https://uwsgi-docs.readthedocs.io/en/latest/](https://uwsgi-docs.readthedocs.io/en/latest/)

[http://connexion.readthedocs.io/en/latest/routing.html](http://connexion.readthedocs.io/en/latest/routing.html)

* [https://medium.com/@ssola/building-microservices-with-python-part-i-5240a8dcc2fb](https://medium.com/@ssola/building-microservices-with-python-part-i-5240a8dcc2fb)
* [https://github.com/hjacobs/connexion-example/blob/master/app.py](https://github.com/hjacobs/connexion-example/blob/master/app.py)
* [http://connexion.readthedocs.io/en/latest/request.html](http://connexion.readthedocs.io/en/latest/request.html)
* Check a token: [https://auth0.com/docs/api-auth/tutorials/verify-access-token](https://auth0.com/docs/api-auth/tutorials/verify-access-token)

API Sources / public api collection: [https://any-api.com](https://any-api.com)

[https://www.programmableweb.com/apis/directory](https://www.programmableweb.com/apis/directory)

[https://apis.guru/browse-apis/](https://apis.guru/browse-apis/)

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

# Language Python Questions:

debug with python:

```
print(variable)
```

* encode json?  `cls=decimalencoder.DecimalEncoder` ?

Overview:

[https://www.fullstackpython.com/table-of-contents.html](https://www.fullstackpython.com/table-of-contents.html)

[https://github.com/mattmakai/fullstackpython.com/pulls](https://github.com/mattmakai/fullstackpython.com/pulls)

Modules: [https://www.tutorialspoint.com/python/python\_modules.htm](https://www.tutorialspoint.com/python/python_modules.htm)

Google Datastore: [https://cloud.google.com/datastore/docs/reference/libraries?hl=de](https://cloud.google.com/datastore/docs/reference/libraries?hl=de)

[https://googlecloudplatform.github.io/google-cloud-python/latest/datastore/client.html](https://googlecloudplatform.github.io/google-cloud-python/latest/datastore/client.html)

