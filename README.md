# Database setup and maintenance

- What is a build script and why do you need one?
- What is database migration?
- Create a build script for a simple database.

# Bulid script

## What is bulid script?

- A build script is a file that is started by a build plan. The build script prepares output from generated files.

## what is build plan ?

- The build plan is a file that makes the following details available at preparation time:
  - The files that need to be processed on the build system
  - The build scripts that are needed to process them
  - The location where the output will be placed

## What the Build Scripts Do?

Build scripts allow files to be built as part of a deploy process but also dynamically as needed during development.

Build scripts can do alot of things, for example:

- compress JavaScript modules into smaller, obfuscated files.
- compile CSS modules from .csst (CSS template) files that can use variables and functions
- compile JST (JavaScript template) modules from .js.jst files in the module folder
- build packages that include JavaScript modules, CSS modules, and HTML template modules
- copy unprocessed static files (such as image assets) from a project's source path to a corresponding location under the project's built path
- Create data in database to set you started.

Our use will be for creating data in the database

## Types of Build Scripts:

- Build Scripts for Building Files
- Development Tool Build Scripts

## Running the Build Scripts:

To run the build scripts in NodeJS, perform the following steps...

1. Open a bash (or equivalent) window.
2. Set your project's root folder as the working directory (cd as necessary).
3. Enter a command to execute, of the form...

```
node [path_to_file]/[build_module_name]
```

```
node ../build/build.js
```

# Database Migration

### What is migration?

- Conversion of an existing application environment into a new architecture by preserving data and functionality of the old architecture.

### What is database migration?

- Database migration — in the context of enterprise applications — means moving your data from one platform to another.
- For example, a business might want to save resources by switching to a cloud-based database. Similarly, another organization could move because they find a particular database suitable for their unique business needs. Hence, it is vital to have an efficient database migration strategy to avoid trouble during the data migration process.

### Why Use Database Migration?

The common reasons for using database migration are:

- Upgrading to the latest version of the database software to improve security and compliance
- Moving existing data to a new database to reduce cost, improve performance, and achieve scalability
- Moving from an on-premise database to a cloud-based database for better scalability and lower costs
- Merge data from several databases into a single database for a unified data view post-merger

### What Is Benefits of Database Migration?

- Database migration is essential because it helps to save money.
- The benefit of database migration is that it helps move data from an outdated legacy system to a modernized software.
- Database migration helps unify disparate data, so it is accessible by different techniques.

### What IS Database Migration Challenges?

- Data Loss: The most common issue firms face data loss during the DB migration. During the planning stage, testing for data loss or data corruption is crucial to verify whether complete data was migrated during the migration process or not.
- Data Security: Data is a business’s most valuable asset. Therefore, its security is of utmost importance. Before the DB migration process occurs, data encryption should be a top priority.

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
