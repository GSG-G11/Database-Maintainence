const {Pool} = require('pg');
const {user, password, database, host, port} = require('./dbconfig');

const pool = new Pool({user, password, database, host, port, ssl: false});

module.exports = {pool};
