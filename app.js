const mysql = require('mysql');

var con = mysql.createConnection({
  host: "192.168.99.148",
  user: "admin",
  password: "admin"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  
});
