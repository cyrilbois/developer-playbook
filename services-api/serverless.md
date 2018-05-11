# Serverless

To be as portable as possible, even with severless, we use [serverless framework](https://serverless.com/framework/docs/). It allows us to deploy our functions across multiple clouds like AWS, GCP, Azure and IBM OpenWisk. 

## Setup  & Installation

Make sure you have your [Developer Environment Setup](../development-environment/) 

```bash
npm install serverless -g
```

In your repo create your **serverless template for Python**

```text
mkdir notes-app-api
cd notes-app-api
sls create --template aws-python3
```

## 

