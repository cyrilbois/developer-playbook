# Getting Started with the Serverless Framework

* What is it and why should you use it?
* how to create a simple API

## Setup your project

* Start a virtual environment

  ```
  virtualenv venv --python=python3
  source venv/bin/activate
  # install pylint 
  pip install pylint
  ```

  If you use visual studio code do this first in your terminal window and then open the folder again with `code .`.

* Create function

  ```
  sls create --template aws-python3
  ```

  Code: [https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a](https://github.com/denseidel/apis-api/commit/915a7cabfddb79d02f398f53f6e56a1c4d2e3f8a)

* update the `serverless.yml` and install [serverless-python-requirements](https://serverless.com/blog/serverless-python-packaging/)

  Code: [https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa](https://github.com/denseidel/apis-api/commit/dad4026fe14c3c42fd99e3576cabaccb039db2aa)



## Create a REST API function

* add function to `serverless.yml`







## More

* https://github.com/serverless/examples









