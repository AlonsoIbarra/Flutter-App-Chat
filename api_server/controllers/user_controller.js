const user = require("../models/user");

module.exports = {
    async getAll(request, result, next ){
        try {
            const data = await user.getAll();
            console.log(`users: ${data}`);
            return result.status(200).json({
                success: true,
                data: data
            });
        } catch (error) {
            console.log(`error: ${error}`);
            return result.status(501).json({
                success: false,
                message: error.message
            });
        }
    },
    async create(request, result, next ){
        try {
            const user_data = request.body;
            const data = await user.create(user_data);
            console.log(`user id: ${data.id}`);
            return result.status(201).json({
                success: true,
                data: data.id
            });
        } catch (error) {
            console.log(`error: ${error}`);
            return result.status(501).json({
                success: false,
                message: error.message
            });
        }
    }
}
