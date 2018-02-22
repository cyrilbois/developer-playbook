# Bootstrap Assets

To get started fast and produce results in accordance with my architectural principles I have assets for most areas:

Todo: 
* Add sample app e.g. including out to all Backend starters
* Check if the docker starter and the service mesh starter can be integrated (can we just deploy the local docker compose (or do I always require minqube?)  to aws?)

Backend / APIs:
* When I have a small *on demand* (I don't expect at least 1 user per hour on average) function I use serverless: [Serverless Starter](#) 
* When I have *always on* (e.g. polling function or expect more then 1 user per hour) then I use docker: [Docker Compose Starter](#) 
* When I expect to have applications that require more then 2 nodes (e.g. 6+ applications) then I use the kubernetes/istio with [Service Mesh Starter](https://github.com/denseidel/cloud-setup)

Frontend: 
* Setup a Frontend \(including auth and my component library\): ...

Analytics Pipeline:
* Setup a Data Architecture \(Object Store + Training Pipeline + Models as a Service\): 



