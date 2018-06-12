# Persistance - DBaaS

## Perstistance

Every microservice should use it's own persitance layer. Optimally this will be a SasS solution. The current list of database can be discovered [hear](https://db-engines.com/de/ranking) and the [zalando technology radar](./).

#### Architectural Decisions

### When to use NoSQL and when RDBS?

### NoSQL Best Practices

{% embed data="{\"url\":\"https://www.youtube.com/watch?v=-o\_VGpJP-Q0\",\"type\":\"video\",\"title\":\"Modeling Data for NoSQL Document Databases\",\"description\":\"Application developers must support unprecedented rates of change – functionality must rapidly evolve to meet customer needs and respond to competitive pressures. To address these realities, developers are increasingly selecting NoSQL document-oriented databases \(e.g. Azure DocumentDB, MongoDB, CouchDB\) for schema-free, scalable and high performance data storage. One of the oft-cited benefits of NoSQL solutions are that they allow for the storage of schema less data. In reality, however, NoSQL solutions provide for schema flexibility, allowing the system to store data as it comes in, permitting dissimilar structures and encouraging seamless data model iteration. While schema flexibility makes it easy to embrace changes to your data model, data modeling is still important in NoSQL systems. In this session, we’ll discuss not only modeling data in Azure DocumentDB, but also migrating and transforming data from traditional, structured data environments.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://www.youtube.com/yts/img/favicon\_144-vfliLAfaB.png\",\"width\":144,\"height\":144,\"aspectRatio\":1},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://i.ytimg.com/vi/-o\_VGpJP-Q0/maxresdefault.jpg\",\"width\":1280,\"height\":720,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.youtube.com/embed/-o\_VGpJP-Q0?rel=0&showinfo=0\",\"html\":\"<div style=\\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\\\"><iframe src=\\\"https://www.youtube.com/embed/-o\_VGpJP-Q0?rel=0&amp;showinfo=0\\\" style=\\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\\" allowfullscreen scrolling=\\\"no\\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

* critical points:
  * embedding vs referencing data
  * reads vs writes
  * normalized vs denormalized vs mixed 

{% embed data="{\"url\":\"https://de.slideshare.net/AmazonWebServices/advanced-design-patterns-for-amazon-dynamodb-dat403-reinvent-2017\",\"type\":\"video\",\"title\":\"Advanced Design Patterns for Amazon DynamoDB - DAT403 - re:Invent 2017\",\"description\":\"This session, we go deep into advanced design patterns for DynamoDB. This session is intended for those who already have some familiarity with DynamoDB and are…\",\"icon\":{\"type\":\"icon\",\"url\":\"https://public.slidesharecdn.com/favicon.ico?d8e2a4ed15\",\"aspectRatio\":0},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"http://image.slidesharecdn.com/dat403-advanced-design-pattern-20bf280b-7aff-4e1d-8865-82785c9899f7-1982393993-171212185929/95/slide-1-1024.jpg\",\"width\":1024,\"height\":576,\"aspectRatio\":0.5625},\"embed\":{\"type\":\"player\",\"url\":\"https://www.slideshare.net/slideshow/embed\_code/key/1nAt031PqO6eJR\",\"html\":\"<div style=\\\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%; padding-top: 38px;\\\"><iframe src=\\\"https://www.slideshare.net/slideshow/embed\_code/key/1nAt031PqO6eJR\\\" style=\\\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\\\" allowfullscreen scrolling=\\\"no\\\"></iframe></div>\",\"aspectRatio\":1.7778}}" %}

{% embed data="{\"url\":\"https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/best-practices.html\",\"type\":\"link\",\"title\":\"Best Practices for DynamoDB - Amazon DynamoDB\",\"description\":\"Best practices for maximizing performance and minimizing throughput costs for working with Amazon DynamoDB.\",\"icon\":{\"type\":\"icon\",\"url\":\"https://docs.aws.amazon.com/images/favicon.ico\",\"aspectRatio\":0}}" %}

{% embed data="{\"url\":\"https://brewing.codes/2017/11/13/dynamo-data-modeling/\",\"type\":\"link\",\"title\":\"Data modeling with DynamoDB \| Brewing Codes\",\"description\":\"DynamoDB is a truly unique and powerful database. It provides a predictable low latency, a vast array of features, tight integration with other AWS services and almost no operational load. The only problem is that its data model can seem …\",\"icon\":{\"type\":\"icon\",\"url\":\"https://brewing.codes/favicon.ico\",\"aspectRatio\":0},\"thumbnail\":{\"type\":\"thumbnail\",\"url\":\"https://brewing.codes/wp-content/uploads/2017/11/library.jpeg\",\"width\":1920,\"height\":1279,\"aspectRatio\":0.6661458333333333}}" %}





Why DynamoDB?

pynamodb \(ORM\) - my experience \(ask in stack overflow with a link to my describe esperience and the code\) why cann't I serialize it back?

boto3 - prefered way by amazon.

[https://www.youtube.com/watch?v=ONLKIUFXLcg&t=2s](https://www.youtube.com/watch?v=ONLKIUFXLcg&t=2s)

[https://www.uplift.agency/blog/posts/2016/03/clearcare-dynamodb](https://www.uplift.agency/blog/posts/2016/03/clearcare-dynamodb)

1. Go to the [AWS Console](https://console.aws.amazon.com/console/home) and Search for "DynamoDB"

   ![](../.gitbook/assets/search-for-dynamodb-on-aws.png)

2. Create a table e.g. "apis"  
   ![](../.gitbook/assets/create-dynamodb-table.png)

   ![](../.gitbook/assets/create-dynamodb-table-1.png)

Important: Partition Key Fieldname can not be changed and it must always be included when you insert data to the database. Like:

![](../.gitbook/assets/partion-key-must-be-included.png)

Further you validate in your that a valid value was send to your service.



1. Create DynamoDB _table name_ `notes` and _Primary key_ with Partition key `userId` and sort key `noteId` and the default created new _IAM Role_ `DynamoDBAutoscaleRole`.



