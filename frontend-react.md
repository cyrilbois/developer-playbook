Develop the Frontend: 

Serverside Rendering: [https://github.com/phodal/serverless-react-server-side-render/blob/master/src/index.js](https://github.com/phodal/serverless-react-server-side-render/blob/master/src/index.js)

AWS Amplify: [https://github.com/d0ruk/serverless-notes-app/tree/master/client](https://github.com/d0ruk/serverless-notes-app/tree/master/client)



## Deploy the Frontend

1. Upload the assets of our app
2. Use a CDN to serve out our assets
3. Point our domain to the CDN distribution
4. Switch to HTTPS with a SSL certificate

AWS provides quite a few services that can help us do the above. We are going to use[S3](https://aws.amazon.com/s3/) to host our assets,[CloudFront](https://aws.amazon.com/cloudfront/) to serve it, [Route 53](https://aws.amazon.com/route53/)to manage our domain, and [Certificate Manager](https://aws.amazon.com/certificate-manager/) to handle our SSL certificate.

  


  






