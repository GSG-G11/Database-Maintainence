const {Pool} = require('pg');
const {user, password, database, host, port} = require('./dbconfig');

const pool = new Pool({user, password, database, host, port});

module.exports = {pool};
