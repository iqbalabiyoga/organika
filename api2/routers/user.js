var user = require('../models/user');

module.exports = {
	configure: function(app){

	app.get('/user', function(req,res){
		user.getUser(res);
	})

	app.post('/login', function(req, res){
		user.login(req.body, res);
	})


	}
}