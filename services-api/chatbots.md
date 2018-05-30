---
description: >-
  Chat becomes a more and more important interface to our system. This section
  describes how to implement a serverless Chatbot.
---

# Chatbots

## Options

* AWS Lex
* GCP Dialogflow

## AWS Lex 

### Connect to facebook messenger

* [Integrating an Amazon Lex Bot with Facebook Messenger](https://docs.aws.amazon.com/lex/latest/dg/fb-bot-association.html)
  * [Exercise 1: Create an Amazon Lex Bot Using a Blueprint \(Console\)](https://docs.aws.amazon.com/lex/latest/dg/gs-bp.html)
  * [Exercise 3: Publish a Version and Create an Alias](https://docs.aws.amazon.com/lex/latest/dg/gettingstarted-ex3.html)
  * [Step 2: Create a Facebook Application](https://developers.facebook.com/docs/messenger-platform/getting-started/quick-start)
    * [App Secret](https://developers.facebook.com/apps/215077339008589/settings/basic/)
    * [Page Access Token](https://developers.facebook.com/apps/215077339008589/messenger/settings/)
  * [Step 3: Integrate Facebook Messenger with the Amazon Lex Bot](https://docs.aws.amazon.com/lex/latest/dg/fb-bot-association.html)
* Use a lambda function for response
  * [message format](https://docs.aws.amazon.com/lex/latest/dg/lambda-input-response-format.html)
* [Multiple Intents Chains / State Initialization](https://docs.aws.amazon.com/lex/latest/dg/book-trip-detail-flow.html)







{% embed data="{\"url\":\"https://docs.aws.amazon.com/lex/latest/dg/lambda-input-response-format.html\",\"type\":\"link\",\"title\":\"Lambda Function Input Event and Response\\n         Format - Amazon Lex\\n      \",\"description\":\"This section describes the structure of the event data that Amazon Lex provides to a Lambda function. Use this information to parse the input in your Lambda code. It also explains the format of the response that Amazon Lex expects your Lambda function to return.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://docs.aws.amazon.com/images/favicon.ico\",\"aspectRatio\":0}}" %}

{% embed data="{\"url\":\"https://medium.com/@vikrame/build-a-chatbot-using-amazon-lex-and-aws-lambda-b90c75ea6626\",\"type\":\"link\",\"title\":\"Build a Chatbot using Amazon Lex and AWS Lambda\",\"description\":\"A chatbot is a service, powered by rules that are based on Artificial Intelligence\(AI\) and Machine Learning algorithms, that you interact…\",\"icon\":{\"type\":\"icon\",\"url\":\"https://cdn-images-1.medium.com/fit/c/304/304/1\*8I-HPL0bfoIzGied-dzOvA.png\",\"width\":152,\"height\":152,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://cdn-images-1.medium.com/max/1200/1\*UfDH65tcj5dtsusnxklcTA.png\",\"width\":348,\"height\":402,\"aspectRatio\":1.1551724137931034}}" %}

{% embed data="{\"url\":\"https://chatbotsmagazine.com/advanced-lex-bot-multi-turn-dialogs-sessions-fbde1c3909d8\",\"type\":\"link\",\"title\":\"Advanced Lex Bot \(Multi-Turn Dialogs & Sessions\)\",\"description\":\"In the previous post, I talk about making your own conversational bot using AWS Lex + Lambda.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://cdn-images-1.medium.com/fit/c/304/304/1\*21YIHiEOUohoIT7\_9Khrig.png\",\"width\":152,\"height\":152,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://cdn-images-1.medium.com/max/1200/1\*YTXhQXcrO8TsCR7DXJVBZw.jpeg\",\"width\":1200,\"height\":675,\"aspectRatio\":0.5625}}" %}

{% embed data="{\"url\":\"https://medium.com/@vikrame/next-gen-big-data-with-aws-part-1-e3f79b37251f\",\"type\":\"link\",\"title\":\"Next Gen Big Data with AWS — Part 1\",\"description\":\"Create EMR Cluster based on S3 Event\",\"icon\":{\"type\":\"icon\",\"url\":\"https://cdn-images-1.medium.com/fit/c/304/304/1\*8I-HPL0bfoIzGied-dzOvA.png\",\"width\":152,\"height\":152,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://cdn-images-1.medium.com/max/1200/1\*wQcjeT2d\_AvOEoNi0c6b3w.png\",\"width\":1200,\"height\":879,\"aspectRatio\":0.7325}}" %}

{% embed data="{\"url\":\"https://github.com/aws-samples/aws-lex-convo-bot-example\",\"type\":\"link\",\"title\":\"aws-samples/aws-lex-convo-bot-example\",\"description\":\"aws-lex-convo-bot-example - Amazon Lex Conversation Bot Sample.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://github.com/fluidicon.png\",\"aspectRatio\":0},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://avatars1.githubusercontent.com/u/8931462?s=400&v=4\",\"width\":210,\"height\":210,\"aspectRatio\":1}}" %}



{% embed data="{\"url\":\"https://nicholasjackson.io/2017/04/25/slack-bot-aws-lambda/\",\"type\":\"link\",\"title\":\"Building a Slackbot with AWS Lambda and Lex\",\"description\":\"This post is intended to walk you through creating a Slackbot with AWS Lambda and Lex.  I am not using any of the Lambda frameworks like Serverless or Apex i...\",\"icon\":{\"type\":\"icon\",\"url\":\"https://nicholasjackson.io/favicon.ico\",\"aspectRatio\":0}}" %}

{% embed data="{\"url\":\"https://docs.aws.amazon.com/lex/latest/dg/lambda-input-response-format.html\",\"type\":\"link\",\"title\":\"Lambda Function Input Event and Response\\n         Format - Amazon Lex\\n      \",\"description\":\"This section describes the structure of the event data that Amazon Lex provides to a Lambda function. Use this information to parse the input in your Lambda code. It also explains the format of the response that Amazon Lex expects your Lambda function to return.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://docs.aws.amazon.com/images/favicon.ico\",\"aspectRatio\":0}}" %}

## Dialogflow

{% embed data="{\"url\":\"https://dialogflow.com/docs/sdks\",\"type\":\"link\",\"title\":\"Dialogflow SDKs  \|  Dialogflow\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.gstatic.com/devrel-devsite/v99a053275cce2e04107c83d5d9342b3cff2b95984673fb335233949c680be78f/dialogflow/images/touchicon-180.png\",\"aspectRatio\":0}}" %}

{% embed data="{\"url\":\"http://dialogflow-python-client-v2.readthedocs.io/en/latest/?\#using-dialogflow\",\"type\":\"link\",\"title\":\"Dialogflow: Python Client — dialogflow 0.1.0 documentation\",\"icon\":{\"type\":\"icon\",\"url\":\"http://dialogflow-python-client-v2.readthedocs.io/favicon.ico\",\"aspectRatio\":0}}" %}



