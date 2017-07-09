var express        = require('express');
var morgan         = require('morgan');
var bodyParser     = require('body-parser');
var methodOverride = require('method-override');
var app            = express();
var exec           = require("child_process").exec;
var execFile       = require("child_process").execFile;

function moveSink(index){
  exec("/usr/local/bin/changesink "+index);
}
function changeVolume(volume){
  exec("~/changeVolume.sh "+volume);
}
function refreshSinks(){

        exec('~/executeJson.sh');
}
refreshSinks();
app.use(express.static(__dirname + '/public'));         // set the static files location /public/img will be /img for users
// Uncomment to Debug
app.use(morgan('dev'));                                         // log every request to the console
app.use(bodyParser());                                          // pull information from html in POST
app.use(methodOverride());                                      // simulate DELETE and PUT
app.get('/refreshSinks',function(req,res){
	// Not Implemented Yet
  refreshSinks();
  res.status(200);
  res.end();
});
app.post('/changeVolume', function(req,res){
  changeVolume(req.body.volume);
	res.status(200);
	res.end();
});
app.post('/moveSink',  function(req, res){
  moveSink(parseInt(req.body.sink));
	res.status(200);
	res.end();
});
app.listen(2221);
console.log('Simple static server listening on port 2221');
