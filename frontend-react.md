Develop the Frontend:

Serverside Rendering: [https://github.com/phodal/serverless-react-server-side-render/blob/master/src/index.js](https://github.com/phodal/serverless-react-server-side-render/blob/master/src/index.js)

AWS Amplify: [https://github.com/d0ruk/serverless-notes-app/tree/master/client](https://github.com/d0ruk/serverless-notes-app/tree/master/client)

## Deploy the Frontend

1. Upload the assets of our app
2. Use a CDN to serve out our assets
3. Point our domain to the CDN distribution
4. Switch to HTTPS with a SSL certificate

AWS provides quite a few services that can help us do the above. We are going to use[S3](https://aws.amazon.com/s3/) to host our assets,[CloudFront](https://aws.amazon.com/cloudfront/) to serve it, [Route 53](https://aws.amazon.com/route53/)to manage our domain, and [Certificate Manager](https://aws.amazon.com/certificate-manager/) to handle our SSL certificate.

### Create the Bucket {#create-the-bucket}

First, log in to your[AWS Console](https://console.aws.amazon.com/)and select S3 from the list of services.![](/assets/open-s3.png)

Select **Create Bucket**and pick a name for your application and select the **US East \(N. Virginia\) Region **Region. Since our application is being served out using a CDN, the region should not matter to us.

![](/assets/create-new-s3-bucket.png)  
![](/assets/create-s3-bucket-1.png)![](/assets/create-s3-bucket-3.png)

![](/assets/create-s3-bucket-4.png)

![](/assets/create-s3-bucket.png)

Now click on your newly created bucket from the list and navigate to its permissions panel by clicking **Permissions**.

  


