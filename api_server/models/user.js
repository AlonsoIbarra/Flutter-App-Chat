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

user.findById = (id) => {
    const sql = `SELECT
        id,
        email,
        name,
        image,
        phone,
        password,
        session_token
    FROM users
    WHERE
        id=$1`;

    return database.oneOrNone( sql, id );
}

user.findByEmail = (email) => {
    const sql = `SELECT
        id,
        email,
        name,
        image,
        phone,
        password,
        session_token
    FROM users
    WHERE
        email=$1`;

    return database.oneOrNone( sql, email );
}

user.save = (user) => {
    const sql = `UPDATE users SET
        email=$1,
        name=$2,
        image=$3,
        phone=$4
    WHERE
        id=$5`;

    return database.oneOrNone(
        sql,
        [
            user.email,
            user.name,
            user.image,
            user.phone,
            user.id,
        ]
    );
}

module.exports = user;