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

Eigene APIs ? In CISL?

Architecture diagram: multicloud ... what security \(IP ranges ... as Apigee what they suggest\)

As Auth0 is currently most established in the community and AWS Cognito is AWS specific: Auth0 is currently the best option - Bitium is currently integrated into the Google Platform and it will be interesting to see i which direction Google will go.

### Register with IAMaaS

1. Signup with [Auth0](https://auth0.com/signup)
   ![](/assets/signup-auth0-1.png)![](/assets/signup-auth0-2.png)

### Build Sample App that authenticated via SSO with your IaaS

Instead of building your own login page - we will redirect to a Auth0 Login Page, then readirect back to our app with an id token attached that included the identity of the user. This token is stored on the local storage of the device and our application will use this token to sign the user in otherwise redirect him to the login page.

Tutorials:

* [https://github.com/auth0-blog/reactjs-authentication-tutorial](https://github.com/auth0-blog/reactjs-authentication-tutorial)
* [https://github.com/auth0-samples/auth0-react-samples](https://github.com/auth0-samples/auth0-react-samples)
* [https://auth0.com/blog/reactjs-authentication-tutorial/?utm\_source=medium&utm\_medium=sc&utm\_campaign=reactjs\_authentication](https://auth0.com/blog/reactjs-authentication-tutorial/?utm_source=medium&utm_medium=sc&utm_campaign=reactjs_authentication)
* [https://auth0.com/blog/build-a-chat-app-with-react/](https://auth0.com/blog/build-a-chat-app-with-react/)
* https://www.udemy.com/complete-react-js-course/





