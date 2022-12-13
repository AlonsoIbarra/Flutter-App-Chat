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
const multer = require('multer');
const firebase_admin = require('firebase-admin');
const firebase_account = require('./serviceAccountKey.json');
/**
 * Initialize firebase
 */
firebase_admin.initializeApp({
    credential: firebase_admin.credential.cert(firebase_account)
});
const upload = multer(
    {
        storage:multer.memoryStorage()
    }
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
const { credential, storage } = require('firebase-admin');
users(app, upload);

server.listen(
    3000,
    '192.168.50.38' || 'localhost',
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