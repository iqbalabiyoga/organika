var connection = require ('../connection');

function User(){
	this.getUser = function(res){
		connection.acquire(function(error,con) {
			con.query('select * from user', function(error, result){
				con.release();
				if(error){
					res.send({status : 0});
				} else {
					res.send(result);
				}
			})
		})
	}

	this.login = function(req,res){
		connection.acquire(function(error,con){
			//Password encypted MD5
			//var creds = [req.email, crypto.createHash('md5').update(req.password).digest("hex")];
			//Password biasa
			var creds = [req.email, req.password];
			var query = 'select * from pengguna where email = ? and password = ?';
			console.log(creds);
			con.query(query, creds, function(error, result){
				con.release();

				if(error){
					res.send({status: 0, message: 'Login failed'});
				} else {
                    if(result.length == 1) {
                       
                        res.json({message: "ok"});
                    } else {
                        res.send({status: 0, message: 'Login failed'});
                    }
                }
            })
        })
    }

}




module.exports = new User();