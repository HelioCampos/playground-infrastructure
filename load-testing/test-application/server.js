"use strict";

var http = require("http");

var server = http.createServer(function (request, response) {
  console.log("Incoming request: '%s'.", request.url);

  response.statusCode = 200;
  response.end("Hello World!");
});

server.listen(process.env.PORT || 8080);
