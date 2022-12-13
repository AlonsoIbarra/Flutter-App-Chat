const database = require("../config/config");
const bcrypt = require("bcryptjs");

const user = {};

user.getAll = () => {
    const sql = `SELECT * FROM users`;
    return database.manyOrNone(sql);
};


user.create = async (usr) => {
    console.log('**1');
    const hash_password = await bcrypt.hash(usr.password, 10);
    console.log('**2');
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
    console.log('**3');
    console.log(usr);
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

user.findById = (id, callback) => {
    const sql = `SELECT
        id,
        email,
        name,
        user,
        image,
        phone,
        password,
        session_token
    FROM users
    WHERE
        id=$1`;

    return database.oneOrNone( sql, id )
        .then( user => {
            callback(null, user);
        });
}

user.findByEmail = (email) => {
    const sql = `SELECT
        id,
        email,
        name,
        user,
        image,
        phone,
        password,
        session_token
    FROM users
    WHERE
        email=$1`;

    return database.oneOrNone( sql, email );
}

module.exports = user;