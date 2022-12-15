const UserModel = require("../models/user");
const bcrypt = require("bcryptjs");
const { token } = require("morgan");
const jwt = require("jsonwebtoken");
const keys = require("../config/keys");
const storage = require("../utils/cloud_storage");

module.exports = {
    async getAll(request, response, next ){
        try {
            const data = await UserModel.getAll();
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
            const data = await UserModel.create(user_data);
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
    async createWithImage(request, response, next ){
        try {
            const files = request.files;
            const user_data = request.body;

            if (files.length > 0 ){                
                const pathImage = `image_${Date.now()}`;
                const url = await storage(files[0], pathImage);
                if (url != undefined && url != null){
                    user_data.image = url;
                }
            }
            const data = await UserModel.create(user_data);
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
    async update(request, response, next ){
        try {
            const files = request.files;
            const user_data = request.body;
            const params = request.params;
            const match_user = await UserModel.findById(params.userId);

            if(!match_user){
                return response.status(400).json({
                    success: false,
                    message: 'User not found'
                });
            }
            if (files.length > 0 ){
                const pathImage = `image_${Date.now()}`;
                const oldPathImage = match_user.image;
    
                const url = await storage(files[0], pathImage, oldPathImage);
    
                if (url != undefined && url != null){
                    match_user.image = url;
                }    
            }
            match_user.name = user_data.name;
            match_user.email = user_data.email;
            match_user.phone = user_data.phone;

            UserModel.save(match_user);
            return response.status(200).json({
                success: true,
                data: match_user
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
            const match_user = await UserModel.findByEmail(email);
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
