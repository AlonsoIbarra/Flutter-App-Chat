const user_controller = require("../controllers/user_controller");
const { app } = require("../server");

module.exports = (app, upload)=>{
    app.get(
        '/api/user/',
        user_controller.getAll
    );
    app.post(
        '/api/user-without-image/',
        user_controller.create
    );
    app.post(
        '/api/user/',
        upload.array('image', 1),
        user_controller.createWithImage
    );
    app.put(
        '/api/user/:userId',
        user_controller.update
    );
    app.put(
        '/api/user/image/:userId',
        upload.array('image', 1),
        user_controller.updateProfileImage
    );
    app.post(
        '/api/user/login',
        user_controller.login
    );
}