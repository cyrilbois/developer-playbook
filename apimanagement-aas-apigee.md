1. [https://community.apigee.com/articles/42269/auth0-with-apigee.html](https://community.apigee.com/articles/42269/auth0-with-apigee.html)
2. [https://community.apigee.com/articles/43082/auth0-with-apigee-external-authorization.html](https://community.apigee.com/articles/43082/auth0-with-apigee-external-authorization.html)

Setup the Identity Provider:

1. Signup and create a client for the developer portal
2. Create the resource server / api you want to protect \(apigee url: [https://denseidel-trial-test.apigee.net/products\](https://denseidel-trial-test.apigee.net/products%29\)
3. Integrate the auth0 apis \(in the end should be proxied through Apigee\) with the the developer portal \( create a client + allowed scopes ...\)   

Setup the OAuthClient API

1. \(Create a new resource server and add the scopes or\) add the scopes to an existing resource server \(this is the way if the endpoint is on the apigee gateway\)

Runtime - Client / App:

* To login the user you can start an authentication transaction with Auth0 constructing a URL as shown below:

```
https://tenant.auth0.com/authorize?scope=openid
profile
&client_id=auth0_client_id
&response_type=token
&redirect_uri=https://jwt.io
&audience=audience
&nonce=random number
&state=random number
```

* After you finished the OAuth Flow you can use this **access\_token **to call the Apigee proxy

```
curl -X GET -H "Authorization: Bearer <access_token>" -H "Cache-Control: no-cache" "http://<your>-test.apigee.net/auth0-hello"
```

Runtime - API Gateway Config:

* The API proxy needs to know how to validate/verify the access\_token that is attached to the Authorization header. The Java Callout Policy in the attached proxy has configuration to allow for this. \(Thanks Dino Chiesa\). The 3 things you will need to change for the Java Callout are:

  * 1. public-key - For RS256 tokens it is the public key of the authorization server
  * 1. iss - Issuer of the token
  * 1. aud - Audience

```
<?xml version="1.0" encoding="UTF-8"?>
<JavaCallout name="JWT-Parse-OpenIDConnect">
   <Properties>
      <Property name="algorithm">RS256</Property>
      <Property name="jwt">{clientrequest.oauthtoken}</Property>


<!--
    public-key used only for algorithm = RS256. This is Auth0 tenant’s public key that you can download from https://tenant.auth0.com/pem or https://tenant.auth0.com/cer and and convert the format if required.

Example: openssl x509  -in cert.cer -pubkey -noout > cert_publickey.pem

You can also configure Apigee Edge to dynamically download RSA public keys from the JWKS (JSON Web Key Set) endpoint exposed by Auth0. https://<tenant>.auth0.com/.well-known/jwks.json and cache it in Apigee Edge using the kid in the JWKS as the key. This step is not enabled in the sample and this article but could be a simple exercise for an Apigee experienced user to download, parse and cache this information in Apigee Edge



-->
      <Property name="public-key">-----BEGIN PUBLIC KEY-----
      …
      -----END PUBLIC KEY-----</Property>
      <Property name="iss">https://tenant.auth0.com</Property>
      <Property name="aud">audience_of_api_defined_in_auth0</Property>
   </Properties>
   <ClassName>com.apigee.callout.jwtsigned.JwtParserCallout</ClassName>
   <ResourceURL>java://apigee-edge-callout-jwt-signed-1.0.6.jar</ResourceURL>
</JavaCallout>
```

[https://github.com/pushpabrol/auth0-tokens-for-apigee](https://github.com/pushpabrol/auth0-tokens-for-apigee)

[https://github.com/apigee/iloveapis2015-jwt-jwe-jws/tree/master/jwt\_signed](https://github.com/apigee/iloveapis2015-jwt-jwe-jws/tree/master/jwt_signed)

apigee - jwt policy: [https://docs.apigee.com/api-services/content/jwt-policies-overview](https://docs.apigee.com/api-services/content/jwt-policies-overview)

[https://community.apigee.com/articles/49280/jwt-policies-in-apigee-edge.html](https://community.apigee.com/articles/49280/jwt-policies-in-apigee-edge.html)

[https://community.apigee.com/questions/49900/apigee-jwt-policy-custom-claim-query.html](https://community.apigee.com/questions/49900/apigee-jwt-policy-custom-claim-query.html)

[https://community.apigee.com/articles/49280/jwt-policies-in-apigee-edge.html](https://community.apigee.com/articles/49280/jwt-policies-in-apigee-edge.html)

[https://github.com/DinoChiesa/ApigeeEdge-JWT-Demonstration](https://github.com/DinoChiesa/ApigeeEdge-JWT-Demonstration)

[https://www.youtube.com/watch?v=YTxiBpOKST0](https://www.youtube.com/watch?v=YTxiBpOKST0)

[https://www.oauth.com/oauth2-servers/token-introspection-endpoint/](https://www.oauth.com/oauth2-servers/token-introspection-endpoint/)

ya29.GlthBe914Av33OmKgb\_Q8OfV4a5hq8yad3xm7T3DWX3OHBm3GMSv55bL04AFzrzOIYUfkdWKBkir3WDksvJcg-6yqJbZ-fLD17QZ0J3lqf0kRnTW\_7M6mL0tSLCE

only vsion api

[https://www.googleapis.com/oauth2/v1/tokeninfo?access\_token=ya29.GlthBe914Av33OmKgb\_Q8OfV4a5hq8yad3xm7T3DWX3OHBm3GMSv55bL04AFzrzOIYUfkdWKBkir3WDksvJcg-6yqJbZ-fLD17QZ0J3lqf0kRnTW\_7M6mL0tSLCE](https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=ya29.GlthBe914Av33OmKgb_Q8OfV4a5hq8yad3xm7T3DWX3OHBm3GMSv55bL04AFzrzOIYUfkdWKBkir3WDksvJcg-6yqJbZ-fLD17QZ0J3lqf0kRnTW_7M6mL0tSLCE)

```
{
 "issued_to": "407408718192.apps.googleusercontent.com",
 "audience": "407408718192.apps.googleusercontent.com",
 "scope": "https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/cloud-vision",
 "expires_in": 3295,
 "access_type": "offline"
}
```

vision and calender

ya29.GlthBWO9OC7g-OfIxVvGMx2cLRAEA74IXQuhsI0LGNt0\_ZeHWdZJ0jpvass2Ri-Ux3Nl6u6mKtkTR5oQC\_gkL4TeMJo2UmRmdtVV2BROPYQCJsp9Qth13Ti-cOE-

```
{
 "issued_to": "407408718192.apps.googleusercontent.com",
 "audience": "407408718192.apps.googleusercontent.com",
 "scope": "https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/calendar.readonly https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/cloud-vision",
 "expires_in": 3576,
 "access_type": "offline"
}
```

[https://github.com/DinoChiesa/ApigeeEdge-JWT-Demonstration/blob/master/proxy-bundles/verify-goog/apiproxy.zip](https://github.com/DinoChiesa/ApigeeEdge-JWT-Demonstration/blob/master/proxy-bundles/verify-goog/apiproxy.zip)







Apigee Routing: https://docs.apigee.com/api-services/content/understanding-routes

