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



