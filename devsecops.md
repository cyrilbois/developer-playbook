Pipeline:

* What is the current state of the art in cloud setups? Jenkins?
* Comparision: [https://blog.takipi.com/jenkins-vs-travis-ci-vs-circle-ci-vs-teamcity-vs-codeship-vs-gitlab-ci-vs-bamboo/](https://blog.takipi.com/jenkins-vs-travis-ci-vs-circle-ci-vs-teamcity-vs-codeship-vs-gitlab-ci-vs-bamboo/)
  * Jenkins for On Premise
  * Cloud CircleCI , then TravisCI

Penetration Testing by the Dev themself and in the Pipeline:

* [https://www.google.de/amp/s/www.csoonline.com/article/2943524/network-security/17-penetration-testing-tools-the-pros-use.amp.html](https://www.google.de/amp/s/www.csoonline.com/article/2943524/network-security/17-penetration-testing-tools-the-pros-use.amp.html)
* [https://www.owasp.org/index.php/OWASP\_Zed\_Attack\_Proxy\_Project](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
* [http://www.toolswatch.org/2017/02/2016-top-security-tools-as-voted-by-toolswatch-org-readers/](http://www.toolswatch.org/2017/02/2016-top-security-tools-as-voted-by-toolswatch-org-readers/)
* [https://github.com/enaqx/awesome-pentest](https://github.com/enaqx/awesome-pentest) 

## TravisCI

Build a cloud first pipeline independent of a cloud platform: [https://travis-ci.org/getting\_started](https://travis-ci.org/getting_started)

* [https://docs.travis-ci.com/user/deployment/codedeploy/](https://docs.travis-ci.com/user/deployment/codedeploy/)
* [https://docs.travis-ci.com/user/for-beginners/](https://docs.travis-ci.com/user/for-beginners/)
* [https://medium.com/a-man-with-no-server/setting-up-a-ci-cd-pipeline-with-travis-ci-for-a-serverless-app-e98b0e57d30c](https://medium.com/a-man-with-no-server/setting-up-a-ci-cd-pipeline-with-travis-ci-for-a-serverless-app-e98b0e57d30c)
* [https://medium.com/@itsdavidthai/comprehensive-aws-ec2-deployment-with-travisci-guide-7cafa9c754fc](https://medium.com/@itsdavidthai/comprehensive-aws-ec2-deployment-with-travisci-guide-7cafa9c754fc)

### Pre - Setup

Create a [Travis CI](https://travis-ci.org/getting_started) account and link to your github

Create a AWS Account and a IAM role and user that can deploy \(look at [IAM section](/identityaas-cognito.md)\) look to[ Frontend section](/frontend-react.md) how to build and deploy.

1. Create and configure s3 bucket to host appliction
2. Create role to access it.

### Setup Pipeline

Deploy to S3: [https://docs.travis-ci.com/user/deployment/s3/](https://docs.travis-ci.com/user/deployment/s3/)

Add a \`.travis.yml':

```
---
dist: trusty
language: node_js
node_js:
- '9'
cache:
  directories:
  - node_modules
script: 
    - npm run build
deploy:
- provider: s3
  access_key_id: $AWS_ACCESS_KEY
  secret_access_key: $AWS_SECRET_KEY
  local_dir: build
  skip_cleanup: true
  bucket: marketplace-client
  region: eu-central-1
after_failure:
  - cat /home/travis/.npm/_logs/*-debug.log
```

Add your `AWS_ACCESS_KEY` and `AWS_SECRET_KEY` to your travis-ci environment variables \([https://travis-ci.org/denseidel/sampleapp-client/settings\](https://travis-ci.org/denseidel/sampleapp-client/settings%29\).

! Important if there is any return except a success e.g. like non used components the build will fail.



## CircleCI

Signup: https://circleci.com/

Select the repository to build, create folder `.circleci` with a file `config.yml`

```
version: 2
jobs:
  build:
    docker:
      - image: debian:stretch
    steps:
      - checkout
      - run:
          name: Greeting
          command: echo Hello, world.
      - run:
          name: Print the Current Time
          command: date
```



https://circleci.com/docs/2.0/deployment\_integrations/\#google-cloud





