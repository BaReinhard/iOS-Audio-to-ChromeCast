var express        = require('express');
var morgan         = require('morgan');
var bodyParser     = require('body-parser');
var methodOverride = require('method-override');
var app            = express();
var exec           = require("child_process").exec;
var execFile       = require("child_process").execFile;
var holder = "";
function moveSink(index){
        exec("/usr/local/bin/changesink "+index);
}
var jsonString;
function refreshSinks(){

        exec('~/executeJson.sh');
}
refreshSinks();
app.use(express.static(__dirname + '/public'));         // set the static files location /public/img will be /img for users
app.use(morgan('dev'));                                         // log every request to the console
app.use(bodyParser());                                          // pull information from html in POST
app.use(methodOverride());                                      // simulate DELETE and PUT
app.get('app/sinks.json', function(req, res){
	res.status(200);
	res.end();
});
app.get('/refreshSinks',function(req,res){
	// Not Implemented Yet
        refreshSinks();
        res.status(200);
        res.end();
});
app.post('/changeVolume', function(req,res){
        volume = req.body.volume;
        exec("~/changeVolume.sh "+volume);
	res.status(200);
	res.end();
});
app.post('/moveSink',  function(req, res){
    // is called when /movesink is requested from any client
        moveSink(parseInt(req.body.sink));
	res.status(200);
	res.end();
});
app.listen(2221);
console.log('Simple static server listening on port 2221');
