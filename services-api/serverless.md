# Serverless



## 

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

