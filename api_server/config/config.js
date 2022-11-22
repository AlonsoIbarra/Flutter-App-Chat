const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e)=>{}
}

const pg_promise = require('pg-promise')(options);
const types = pg_promise.pg.types;
types.setTypeParser(
    1114,
    function(stringValue){
        return stringValue;
    }
);

const database_config = {
    'host': 'localhost',
    'port': 5432,
    'database': 'flutter_app',
    'user': 'postgres',
    'password': 'A1E2I3O4U5'
}
const database = pg_promise(database_config);
module.exports = database;
