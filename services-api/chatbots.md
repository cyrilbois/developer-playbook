# Chatbots

## Architecture Decisions

* [ADR-0005](https://github.com/denseidel/developer-playbook/blob/master/docs/adr/0005-use-dialogflow-for-chatbots.md) - Use Dialogflow for chatbots

## Dialogflow

* [Getting Started](https://dialogflow.com/docs/getting-started/basics)
* Implement the intent \(e.g. "manage bmi"\) see the [Google Documenation](https://dialogflow.com/docs/getting-started/building-your-first-agent)
  * First Model your Dialog

![&quot;Manage BMI&quot; Dialog](../.gitbook/assets/manage-bmi-dialog.svg)

* [Create a "Default Welcome Intent"](https://dialogflow.com/docs/getting-started/basic-fulfillment-conversation#editing_the_welcome_intent) with answers: "_Hi I am your personal trainer, let me advice you on your health. I can currently calculate your BMI, store the BMI and advices you on your BMI."_



* Implement the fulfilment - basic \(everything in on file\) with firebase
* Test a chatbot - manually & unit test
* Connect the Chatbot to Facebook Messanger
* Integrate fulfilment with REST Python AWS Lambda \(e.g. "analyse my bmi trend"\) 





[https://miningbusinessdata.com/dialogflow-tutorial-setting-context-from-your-inline-webhook-using-contextout/](https://miningbusinessdata.com/dialogflow-tutorial-setting-context-from-your-inline-webhook-using-contextout/)



{% embed data="{\"url\":\"https://dialogflow.com/docs/sdks\",\"type\":\"link\",\"title\":\"Dialogflow SDKs  \|  Dialogflow\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.gstatic.com/devrel-devsite/v99a053275cce2e04107c83d5d9342b3cff2b95984673fb335233949c680be78f/dialogflow/images/touchicon-180.png\",\"aspectRatio\":0}}" %}

{% embed data="{\"url\":\"http://dialogflow-python-client-v2.readthedocs.io/en/latest/?\#using-dialogflow\",\"type\":\"link\",\"title\":\"Dialogflow: Python Client — dialogflow 0.1.0 documentation\",\"icon\":{\"type\":\"icon\",\"url\":\"http://dialogflow-python-client-v2.readthedocs.io/favicon.ico\",\"aspectRatio\":0}}" %}



