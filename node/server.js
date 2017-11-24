var express = require('express');
var morgan = require('morgan');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');
var app = express();
var exec = require('child_process').exec;
var execFile = require('child_process').execFile;

function moveSink(index) {
    exec('/usr/local/bin/changesink ' + index);
}
function changeVolume(volume) {
    exec('/usr/local/bin/changeVolume.sh ' + volume);
}
function os_func() {
    this.execCommand = function(cmd, callback) {
        exec(cmd, (error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: ${error}`);
                return;
            }

            callback(stdout);
        });
    };
}
exec('/usr/local/bin/executeJson.sh');
app.use(express.static(__dirname + '/public')); // set the static files location /public/img will be /img for users
// Uncomment to Debug
app.use(morgan('dev')); // log every request to the console
app.use(bodyParser()); // pull information from html in POST
app.use(methodOverride()); // simulate DELETE and PUT
app.get('/refreshSinks', function(req, res) {
    // Not Implemented Yet
    var os = new os_func();
    os.execCommand('/usr/local/bin/executeJson.sh', function(returnValue) {
        var sinksFile = JSON.parse(require('fs').readFileSync(__dirname + '/public/app/sinks.json', 'utf8'));
        res.status(200);
        res.json(sinksFile);
    });
});
app.post('/changeVolume', function(req, res) {
    changeVolume(req.body.volume);
    res.status(200);
    res.end();
});
app.post('/moveSink', function(req, res) {
    moveSink(parseInt(req.body.sink));
    res.status(200);
    res.end();
});
app.listen(2221);
console.log('Simple static server listening on port 2221');
