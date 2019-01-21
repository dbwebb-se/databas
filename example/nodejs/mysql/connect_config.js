/**
 * Create a connection to the database and execute
 * a query without actually using the database.
 * Use a config.json for the connection details.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("./config.json");



/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;

    sql = "SELECT 1+1 AS Sum";
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
