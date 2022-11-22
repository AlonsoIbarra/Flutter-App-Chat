const user_controller = require("../controllers/user_controller");
const { app } = require("../server");

module.exports = (app)=>{
    app.get(
        '/api/user/',
        user_controller.getAll
    );
    app.post(
        '/api/user/',
        user_controller.create
    );
}