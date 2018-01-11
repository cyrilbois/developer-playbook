# Serverless: The Complete Developer's Guide

**TARGET READER**

* basic programming knowledge \(best Python & Javascript\)
* 
### 

I write this in **January 2018** while I am working on the best stack to build modern applications fast. I currently working for a large insurance company and maintaining the tech stack is a pain. therefore the benefits of serverless have a huge potential to increase the speed. But there are many technology choices in the serverless ecosystem - and there is no right question to a "best tech stack" question it always depends. For me the following made sense:

* _What cloud provider to chose?_ I go for the largest provider as the ecosystem helps me from learning to open source assets and libaries. Currently **AWS** is the biggest serverless cloud provider also compared to Google \(the other big option\) they offer serverless functions for other languages then Javascript. Further you can integrate for specific function other cloud providers like Google for Analytics.
* _What language to use?_ More and more code is better expressed as machine learning model for that area and the integration into frameworks like Karas / Tensorflow **Python** is best. Also the resources intensity as well as the startup time is best for Python on AWS. Not the runtime performance there Java still seams to beat Python - as well in the validation / typing area. But serverless code should be small therefore 100 lines of code in a service should be readable without complex tooling. Also AWS implemented their serverless framework Chalice in Python.

* _What framework to use?_ Serverless function get fast confusion and a framework to organize functions logically \(at development time not runtime\) into services helps. The current leader seams to be the **serverless framework**.

* _What technology to implement the client/frontend?_ Javascript is the way to go in the browser and because of the largest community and performance aspects i decide to use **react**. It also allows to implement native mobile applications with react native.

In the following section we will do 



