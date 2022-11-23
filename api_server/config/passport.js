const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt;
const User = require('../models/user');
const { secretOrKey } = require('./keys');
const keys = require('./keys');

module.exports = function(passport){
    let options = {};
    options.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme('jwt');
    options.secretOrKey = keys.secretOrKey;
    passport.use(new JwtStrategy(
        options,
        (jwt_payload, done)=>{
            User.findById(jwt_payload.id,(error, user)=>{
                if(error){
                    return done(error, false);
                }
                if(user){
                    return done(null, user);
                }
                return done(null, false);
            });
        }
    ));
}