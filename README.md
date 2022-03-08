# **Create a Build Script**

## Before you Start

Clone this repo by running the following in your terminal and follow along!

```
git clone https://github.com/GSG-G11/Database-Maintainence.git
```

Install the required packages

```
npm install
```

**_Now we're ready to take off!_**

## Configuration

Start by configuring your PostgreSQL settings in _dbconfig.js_ to match your own local configurations.

```
module.exports = {
  user: '',
  database: '',
  password: '',
  host: 'localhost',
  port: 5432,
};
```

Now Let's test our connection to the database by running the following script in terminal.

```
npm start
```

If everything went well you will see a `connected to DB` in terminal.

## Build

Proceeding now to build our tables in the database, you can find a ready to run sql file in _db/build/build.sql_.

You can edit it as you want as long as you know **SQL**. But for now we are sticking to the default file.

Let's make our build code that is going to read the **SQL** and execute it.

In _db/build/build.js_, write the following code:

```
//Requiring the modules

const fs = require('fs');
const {pool} = require('./../db');

//Read the Build.sql file
const sqlBuildQuery = fs.readFileSync('db/build/build.sql', 'utf8');

//Execute the Build.sql file
pool.query(sqlBuildQuery, (err, res) => {
  if (err) {
    return console.error('Error making query', err);
  }

  console.log('Users Table was successfully Built');
  console.log('Cars Table was successfully Built');
});

//end connection to database
pool.end();


```

Now let's add a script to our package.json to make our life easier when executing this file.

Go to _package.json_ and add the following script in "scripts"

```
"build": "node ./db/build/build.js"
```

Now Let's execute the script by running the following in the terminal

```
npm run build
```

The server now will read and execute the **SQL** commands in the sql file. If you haven't touched the **SQL** file you will see the following in your terminal.

```
Users table was successfully Built
Cars table was successfully Built
```

## Check

Great job following till now! Now let's check the data that we have created

Start the server by running

```
npm start
```

And in browser you can go to, as long as you didn't change the Port.

```
http://localhost:3000/users
http://localhost:3000/cars
```

**Hope that helped!**
