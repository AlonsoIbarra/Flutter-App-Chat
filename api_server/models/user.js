const database = require("../config/config");

const user = {};

user.getAll = () => {
    const sql = `SELECT * FROM users`;
    return database.manyOrNone(sql);
};


user.create = (usr) => {
    const sql = `INSERT INTO users(
        email,
        name,
        phone,
        image,
        password,
        created_at,
        updated_at    
    )
    VALUES( $1, $2, $3, $4, $5, $6, $7) RETURNING id`;
    return database.oneOrNone(
        sql,
        [
            usr.email,
            usr.name,
            usr.phone,
            usr.image,
            usr.password,
            new Date,
            new Date
        ]
    );
};

module.exports = user;