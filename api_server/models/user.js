const database = require("../config/config");
const bcrypt = require("bcryptjs");

const user = {};

user.getAll = () => {
    const sql = `SELECT * FROM users`;
    return database.manyOrNone(sql);
};


user.create = async (usr) => {
    const hash_password = await bcrypt.hash(usr.password, 10);
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
            hash_password,
            new Date,
            new Date
        ]
    );
};

module.exports = user;