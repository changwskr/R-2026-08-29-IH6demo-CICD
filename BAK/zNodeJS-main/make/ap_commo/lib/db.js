var mysql = require('mysql');

var db = mysql.createConnection({
  host:'172.17.0.3',
  user:'root',
  password:'!1974yoe0',
  database:'opentutorials'
});

db.connect();
// 이 모듈을 외부로 참조하는 것을 허용한다.
module.exports = db;