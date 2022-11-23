const express = require('express');
const app = express(); 
const http = require('http');
const logger = require('morgan');
const cors = require('cors');
const passport = require('passport');
const { response } = require('express');
const server = http.createServer(
    app
);

const port = process.env.port || 3000;
app.use(
    logger('dev')
);
app.use(
    express.json()
);
app.use(
    express.urlencoded({
        extended: true
    })
);
app.use(
    cors()
);
app.use(
    passport.initialize()
);
app.use(
    passport.session()
);

require('./config/passport')(passport);

app.disable(
    'x-powered-by'
);
app.set(
    'port',
    port
);

// Import routes
const users = require('./routes/user_routes');
const passport_function = require('./config/passport');
users(app);

server.listen(
    3000,
    '192.168.1.80' || 'localhost',
    function(){
        console.log('On listening in ' + process.pid + ' ...');
    }
);

app.use((error, request, result, next)=>{
    console.log(error);
    response.status(error.status||500).send(error.stack);
});

module.exports = {
    app: app,
    server: server
}