1. [https://community.apigee.com/articles/42269/auth0-with-apigee.html](https://community.apigee.com/articles/42269/auth0-with-apigee.html)
2. [https://community.apigee.com/articles/43082/auth0-with-apigee-external-authorization.html](https://community.apigee.com/articles/43082/auth0-with-apigee-external-authorization.html)

Setup the Identity Provider:

1. Signup and create a client for the developer portal
2. Create the resource server / api you want to protect \(apigee url: https://denseidel-trial-test.apigee.net/products\)
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

* Configure the API Proxy:  



