The world database and JavaScript
===========================

Example on how to connect to a database using JavaScript.

This example also contains well defined code structure using a `src/` directory, modules, config files and static code validators.



Get going
---------------------------

Ensure that you have the databas `world` installed. You can set it up like this.

```
mariadb < example/sql/v2/world.sql
```

You can check that it works like this.

```
$ mariadb world -e "SELECT Name FROM country WHERE Code='swe'"
+--------+
| Name   |
+--------+
| Sweden |
+--------+
```

Install the needed packages by using npm and the file `package.json`.

```
npm install
```

Start the cli program.

```
npm start
# or
node cli.js
```



Clean up the installation
---------------------------

Run the following script to clean up your installation. The directories and files created by `npm install` will then be removed.

```
npm run clean
```
