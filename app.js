const express = require('express');
const app = express();
const {pool} = require('./db/db');

//Test connection to database
pool.connect(err => {
  if (err) {
    return console.error('Error connecting to DB', err);
  }
  console.log('connected to DB');
});

//Get all the users from the table that we built
app.get('/users', (req, res) => {
  pool.query('SELECT * FROM users_test', (err, response) => {
    if (err) {
      return console.error('Error making query', err);
    }
    res.send(response.rows);
  });
});

app.get('/cars', (req, res) => {
  pool.query('SELECT * FROM cars_test', (err, response) => {
    if (err) {
      return console.error('Error making query', err);
    }
    res.send(response.rows);
  });
});

//Listen to server
app.listen(3000, () => {
  console.log('Listening on port 3000');
});
