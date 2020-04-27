
####################
# 1 Kubernetes cluster
# 2 Minikube
####################




minikube/server.js
---------------------------
var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end('Hello World!');
};
var www = http.createServer(handleRequest);
www.listen(8080);



minikube/Dockerfile 
----------------------------
FROM node:6.14.2
EXPOSE 8080
COPY server.js .
CMD [ "node", "server.js" ]





[root@main minikube]# docker build .


Successfully built 3f4eccd2a431

