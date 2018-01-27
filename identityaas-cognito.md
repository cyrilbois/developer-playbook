# Identity as a Service

To secure your app and mange user identities you can either build your own secuirty \(which is bad practice unless you are a security startup that sees it advantage in build novel and better security\), use a existing solution like keycloak and integrate it into your application or use a SaaS solution that provides you Identitymanagement.

## Products

* Host your own: 
  * [Keycloak](http://www.keycloak.org)
  * [Forgerock](https://backstage.forgerock.com/docs/am)
* SaaS
  * [AWS Cognito](https://aws.amazon.com/de/cognito/): AWS specific, not good for multi cloud
  * [Auth0](https://auth0.com/): large community
  * [Bitium](https://www.bitium.com/): Bought by google

Tasks to build a MVP that shows you the different Aspects of building an Identity Plattform:

* Register with IAMaaS
* Build Sample App that authenticated via SSO with your IaaS

* Configure the provider so it integrates with your domain - so that it looks like your own webpage

* Create Backend API and protect it with IAM

* Integrate API Gateway with IAM
* Expose API on API Gateway
* Build Developer Portal and Integrate it with IAM for Signup, Management of Clients and Signup of APIs



