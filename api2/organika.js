var express = require('express');
var bodyparser = require('body-parser');
var connection = require('./connection');
var app = express();
var server = require('http').createServer(app);
var port = process.env.PORT || 2017;

server.listen(port, function () {
  console.log('Server listening at port %d', port);
});

var userRoutes = require('./routers/user');

app.use(function(req,res,next){
	res.setHeader('Access-Control-Allow-Origin', '*');
	res.setHeader('Access-Control-Allow-Methods', 'GET, PUT, DELETE, POST');
	res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With, content-type');
	res.setHeader('Access-Control-Allow-Credentials', true);
	next();
})

app.use(express.static(__dirname + '/public'));
app.use(bodyparser.urlencoded({extended: true}));
app.use(bodyparser.json());

app.get('/', function (req, res){
	res.send('Hello World!');
})

connection.init();
userRoutes.configure(app);
