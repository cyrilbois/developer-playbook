# Frontend Framework React

I stick with React up to the point that the others are at least on the same functional level: Native and Frontend.

Link: [https://github.com/enaqx/awesome-react](https://github.com/enaqx/awesome-react)

# Develop the Frontend:

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

![](/assets/s3-bucket-permissions.png)

```
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::developerportal-client/*"]
    }
  ]
}
```

![](/assets/configure-static-content-for-s3.png)![](/assets/configure-static-webhosting-s3-1.png)

Now select **Use this bucket to host a website **and add our`index.html`as the **Index Document **and the **Error Document**. Since we are letting React handle 404s, we can simply redirect our errors to our`index.html`as well. Hit **Save **once you are done.

![](/assets/configure-static-content-s3.png)

This panel also shows us where our app will be accessible. AWS assigns us a URL for our static website. In this case the URL assigned to me is `http://developerportal-client.s3-website.eu-central-1.amazonaws.com`.

## Build Our App

Create React App comes with a convenient way to package and prepare our app for deployment. From our working directory simply run the following command.

```
npm run build
```

This packages all of our assets and places them in the`build/`directory.

### Upload to S3 {#upload-to-s3}

Now to deploy simply run the following command; where`YOUR_S3_DEPLOY_BUCKET_NAME`is the name of the S3 Bucket we created before.

```
aws s3 sync build/ s3://YOUR_S3_DEPLOY_BUCKET_NAME 
// aws s3 sync build/ s3://developerportal-client
```

All this command does is that it syncs the`build/`directory with our bucket on S3. Just as a sanity check, go into the S3 section in your [AWS Console](https://console.aws.amazon.com/console/home) and check if your bucket has the files we just uploaded.

# Build a component galery

* [https://medium.com/@efreyreg/create-react-component-libraries-with-storybook-and-styled-jsx-8999f423f06b](https://medium.com/@efreyreg/create-react-component-libraries-with-storybook-and-styled-jsx-8999f423f06b)
* [https://codeburst.io/build-your-own-react-component-library-with-lerna-and-storybook-53298b186760](https://codeburst.io/build-your-own-react-component-library-with-lerna-and-storybook-53298b186760)
* [https://hackernoon.com/building-a-react-component-library-part-1-d8a1e248fe6c](https://hackernoon.com/building-a-react-component-library-part-1-d8a1e248fe6c)
* [https://voice.kadira.io/introducing-react-storybook-ec27f28de1e2](https://voice.kadira.io/introducing-react-storybook-ec27f28de1e2)
* [https://hackernoon.com/javascript-nodejs-es6-react-storybook-example-tutorial-config-develop-ui-native-demo-bb58039c929](https://hackernoon.com/javascript-nodejs-es6-react-storybook-example-tutorial-config-develop-ui-native-demo-bb58039c929)
* [https://blog.hichroma.com/introduction-to-storybook-5aca8cc643f7](https://blog.hichroma.com/introduction-to-storybook-5aca8cc643f7)
* [http://ouicar.github.io/2017/01/05/storybook-2.html](http://ouicar.github.io/2017/01/05/storybook-2.html)
* http://andreafalzetti.github.io/blog/2017/05/30/bundling-react-15-bootstrap-4-storybook-3-with-webpack-2.html



Tools:

* [https://github.com/storybooks/storybook](https://github.com/storybooks/storybook) / [https://storybook.js.org/examples/](https://storybook.js.org/examples/) 
* [https://github.com/insin/nwb](https://github.com/insin/nwb) 



* https://github.com/storybooks/storybook/issues/25
* http://andreafalzetti.github.io/blog/2017/05/30/bundling-react-15-bootstrap-4-storybook-3-with-webpack-2.html



Create sampleapp-client

```
create-react-app sampleapp-client
cd sampleapp-client
```

Install storybook.js

```
npm i --save-dev @storybook/react
```



