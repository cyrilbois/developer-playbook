# Services/API

## Service/API

The core business functions are develop in services either using microservices or event driven actors.These can be implemented on the [platform ](../plattform.md)either as _serverless_ or _containers_.

**Architectural Decisions**

1. Languages: Python/NodeJS

### Stack

1. Understand the domain - [create a lean diagram](../architecture.md) with a domain diagram \(events, commands, actors, aggregates\), interaction diagram and a first deployment diagram, \(squnce diagram? not at this stage right?\).
2. Design the API / Event in Swagger.
3. Setup the project
4. Decide if it is [serverless or container use case.](../plattform.md)
5. Implement the first mock. 
6. Implement the API or Event Actor. 

## Design the API

First we start designing the API with Swagger. The best tool to do this is the [swagger editor](https://github.com/swagger-api/swagger-editor). I suggest adding the swagger editor to the docker-compose file in your project:

```text
services:
  swaggereditor:
    image: swaggerapi/swagger-editor
    ports:
      - "80:8080"
```

Create your swagger file: [basic swagger file structure](https://swagger.io/docs/specification/2-0/basic-structure/)

## Setup the project

* Create [new github repo](https://github.com/new): ![](../.gitbook/assets/create-github-repo-for-project.png)
* Clone repo:

  ```text
  git clone https://github.com/denseidel/consumer-marketplace-service.git
  cd consumer-marketplace-service
  git secrets --install
  git secrets --register-aws
  ```

* Start a virtual environment

  ```text
  virtualenv venv --python=python3
  source venv/bin/activate
  # install pylint 
  pip install pylint
  ```

  If you use visual studio code do this first in your terminal window and then open the folder again with `code .`.

## Developer a docker microservice in Python

1. Check that you have have a local docker environment in [Plattform](../plattform.md) -&gt; Setup Docker Environment.
2. Create Dockerfile and docker-compose that starts the Mock Server\([Code](https://github.com/denseidel/products-marketplace-service/commit/6303f0ba152be610dc4fabcf85d624a4e32faa31)\) - make sure the Swagger  file does not include custom functions like `x-tokenInfoFunc`. **TODO create it for the mock** 
   * [Environment Variables to connect to AWS](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
3. Implement Frontend against mocks
4. Update Dockerfile to production config
5. Implement API \(including DB, ...\)

Connexion Examples:

* [https://github.com/hjacobs/connexion-example](https://github.com/hjacobs/connexion-example)
* [https://github.com/ssola/python-flask-microservice](https://github.com/ssola/python-flask-microservice)
* [http://blog.bejanalex.com/2017/03/mongodb-rest-api-interface-in-docker/](http://blog.bejanalex.com/2017/03/mongodb-rest-api-interface-in-docker/)

Create a client library for the API:

* [https://realpython.com/blog/python/api-integration-in-python/](https://realpython.com/blog/python/api-integration-in-python/)

Use Feature flags:

* [https://featureflags.io/python-feature-flags/](https://featureflags.io/python-feature-flags/)

Python Testing:

* Unit Testing
* Mocks
* Code Coverage

Python Functional Programming:

* [https://maryrosecook.com/blog/post/a-practical-introduction-to-functional-programming](https://maryrosecook.com/blog/post/a-practical-introduction-to-functional-programming)

Python Clean Code:

* [http://pythonforengineers.com/writing-great-code/](http://pythonforengineers.com/writing-great-code/)
* [https://github.com/zedr/clean-code-python](https://github.com/zedr/clean-code-python)
* [https://github.com/rmariano/Clean-code-in-Python/blob/master/build/Clean code in Python.pdf](https://github.com/rmariano/Clean-code-in-Python/blob/master/build/Clean%20code%20in%20Python.pdf)
* [http://docs.python-guide.org/en/latest/writing/reading/](http://docs.python-guide.org/en/latest/writing/reading/)
* **Getting Started with the Serverless Framework**
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

* [https://github.com/serverless/examples](https://github.com/serverless/examples)

## develop a api \(api first\) with swagger, python and the serverless framework

Principle of Good API Development vs Bad API Development

* Bad API Developers start by write code and tackle the technical challanges. Good API designer enable fast feedback by designing the interfaces showing it to the \(API\) customer and itterate on that. 
* Bad API Developer design for days and weeks until "perfection". Good API Developers find the the point of minimal agreement with the customer and then write the code, find new challanges based on the technology and itterated again with the customer over the best solution. 
* Bad API Developer on initial implementation speed, Good API Developer focus on reduced cycle times \(with api customers and technology\).
  * [https://www.youtube.com/watch?v=SEQeovx5z\_A](https://www.youtube.com/watch?v=SEQeovx5z_A)
  * Use API First Frameworks: [https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto](https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto)

Benefits API First:

![](../.gitbook/assets/advantages-of-api-first.png)

[https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto\#python-flask-connexion](https://github.com/swagger-api/swagger-codegen/wiki/server-stub-generator-howto#python-flask-connexion)

[http://connexion.readthedocs.io/en/latest/cli.html](http://connexion.readthedocs.io/en/latest/cli.html)

[https://blog.runscope.com/posts/openapi-swagger-resource-list-for-api-developers](https://blog.runscope.com/posts/openapi-swagger-resource-list-for-api-developers)

[https://medium.com/ibm-data-science-experience/deploy-your-python-functions-as-a-rest-api-811981ec7ec5](https://medium.com/ibm-data-science-experience/deploy-your-python-functions-as-a-rest-api-811981ec7ec5)

[https://github.com/zalando/connexion](https://github.com/zalando/connexion)

[http://michal.karzynski.pl/blog/2016/06/19/building-beautiful-restful-apis-using-flask-swagger-ui-flask-restplus/](http://michal.karzynski.pl/blog/2016/06/19/building-beautiful-restful-apis-using-flask-swagger-ui-flask-restplus/)

[https://cidrblock.github.io/zero-to-api-in-4-minutes.html](https://cidrblock.github.io/zero-to-api-in-4-minutes.html)

Beispiel: [https://github.com/hjacobs/connexion-example](https://github.com/hjacobs/connexion-example)

### Develop API First in Python

Check how to get started with Python: [Serverless Framework \(Python\)](https://github.com/denseidel/developer-playbook/tree/0de27ab0d5cf97c58fdeec5a26159b0fa55f0ef2/serverless-framework.md)

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

## Language Python Questions:

debug with python:

```text
print(variable)
```

* encode json?  `cls=decimalencoder.DecimalEncoder` ?

Overview:

[https://www.fullstackpython.com/table-of-contents.html](https://www.fullstackpython.com/table-of-contents.html)

[https://github.com/mattmakai/fullstackpython.com/pulls](https://github.com/mattmakai/fullstackpython.com/pulls)

Modules: [https://www.tutorialspoint.com/python/python\_modules.htm](https://www.tutorialspoint.com/python/python_modules.htm)

Google Datastore: [https://cloud.google.com/datastore/docs/reference/libraries?hl=de](https://cloud.google.com/datastore/docs/reference/libraries?hl=de)

[https://googlecloudplatform.github.io/google-cloud-python/latest/datastore/client.html](https://googlecloudplatform.github.io/google-cloud-python/latest/datastore/client.html)
