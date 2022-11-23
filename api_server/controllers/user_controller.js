const User = require("../models/user");
const bcrypt = require("bcryptjs");
const { token } = require("morgan");
const jwt = require("jsonwebtoken");
const keys = require("../config/keys");

module.exports = {
    async getAll(request, response, next ){
        try {
            const data = await User.getAll();
            return response.status(200).json({
                success: true,
                data: data
            });
        } catch (error) {
            console.log(`error: ${error}`);
            return response.status(501).json({
                success: false,
                message: error.message
            });
        }
    },
    async create(request, response, next ){
        try {
            const user_data = request.body;
            const data = await User.create(user_data);
            return response.status(201).json({
                success: true,
                data: data.id
            });
        } catch (error) {
            console.log(`error: ${error}`);
            return response.status(501).json({
                success: false,
                message: error.message
            });
        }
    },
    async login(request, response, next){
        try {
            const email = request.body.email;
            const password = request.body.password;
            const match_user = await User.findByEmail(email);
            if(!match_user){
                return response.status(400).json({
                    success: false,
                    message: 'User not found'
                });
            }
            const isValid = await bcrypt.compare(password, match_user.password);
            if( isValid){
                const token = jwt.sign(
                    {
                        id: match_user.id,
                        email: match_user.email,
                    },
                    keys.secretOrKey,
                    {
                        // expiresIn: 
                    }
                );
                const data = {
                    id: match_user.id,
                    name: match_user.name,
                    user: match_user.user,
                    email: match_user.email,
                    phone: match_user.phone,
                    image: match_user.image,
                    session_token: `JWT ${token}`
                };
                return response.status(200).json({
                    success: true,
                    data: data
                });
            }
            return response.status(401).json({
                success: false,
                message: "Wrong password"
            });
        } catch (error) {
            console.log(`error: ${error}`);
            return response.status(501).json({
                success: false,
                message: error.message
            });
        }

    }
}
