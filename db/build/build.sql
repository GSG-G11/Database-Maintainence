BEGIN;

DROP TABLE IF EXISTS users_test CASCADE;
DROP TABLE IF EXISTS cars_test CASCADE;
CREATE TABLE users_test (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);


CREATE TABLE cars_test (
    id SERIAL PRIMARY KEY,
    model TEXT NOT NULL,
    year INTEGER NOT NULL,
    color TEXT NOT NULL,
    price INTEGER NOT NULL,
    owner_id INTEGER NOT NULL REFERENCES users_test(id)
);




INSERT INTO users_test (name, email, password) VALUES ('John Doe', 'john@doe.com', 'password'), ('Jane Doe', 'jane@doe.com', 'password'), ('Joe Doe','joe@doe.com', 'passowrd');



INSERT INTO cars_test (model, year, color, price, owner_id) VALUES ('Ford', 2018, 'red', 10000, 1), ('Audi', 2018, 'blue', 20000, 2), ('BMW', 2018, 'black', 30000, 3);

COMMIT;
