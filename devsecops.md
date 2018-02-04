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

Signup: [https://circleci.com/](https://circleci.com/)

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

Setup the Google Cloud SDK: [https://circleci.com/docs/2.0/deployment\_integrations/\#google-cloud](https://circleci.com/docs/2.0/deployment_integrations/#google-cloud)

1. Create a Service Account and Download: Go to Google’s [Getting Started with Authentication](https://cloud.google.com/docs/authentication/getting-started) article and follow the instructions in the **Creating a service account **section.

2. Add Service Account to CircleCI Environment

   1. Encode the JSON file you downloaded in base64 format and copy the result to the clipboard. 
      `openssl base64 -in My\ Project-pripeline-key-c3940707f9ea.json -out base64.txt`
   2. In the CircleCI application, go to your project’s settings by clicking the gear icon in the top right.
   3. In the **Build Settings **section, click **Environment Variables**, then click the **Add Variable **button.
   4. Name the variable. In this example, the variable is named`GCLOUD_SERVICE_KEY`.
   5. Paste the contents from Step 2 into the **Value **field.
   6. Click the **Add Variable **button.
      ![](/assets/add-googlecloud-secret-to-circleci.png)

   ### Decode and Store Service Account {#decode-and-store-service-account}

   To authenticate the`gcloud`tool, you will first need to decode the environment variable you created above. You could do that by adding the following command to`config.yml`:

   ```
   echo $GCLOUD_SERVICE_KEY | base64 --decode --ignore-garbage > ${HOME}/gcloud-service-key.json
   ```

   This will decode the secret into a file named`gcloud-service-key.json`.

   ### Setup the Pipeline Machine and set Google Application Credentials

```
#!/bin/bash

#check where gcloud is installed 
which gcloud

# Set Google Application Credentials
echo $GCLOUD_SERVICE_KEY | base64 --decode --ignore-garbage > ${HOME}/gcloud-service-key.json && export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/gcloud-service-key.json"

# Authenticate the gcloud tool
gcloud auth activate-service-account --key-file=${HOME}/gcloud-service-key.json
gcloud config set project $GCLOUD_PROJECT
```







