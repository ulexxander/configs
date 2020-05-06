const path = require('path');
const express = require('express');
const app = express();

const port = 8000;

app.use('/css', express.static('dist/css')).use(function(req, res, next){
    console.log('we are requesting /css!')
    next();
});

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/dist/index.html'));
});

app.listen(port, function() {
    console.log('Listening started!');
});