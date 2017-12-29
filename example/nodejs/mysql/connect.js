/**
 * To verify that mysql is installed and is working.
 * Create a connection to the database and execute
 * a query without actually using the database.
 */
"use strict";

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const mysql = require("promise-mysql");
    const db    = await mysql.createConnection({
        "host":     "localhost",
        "user":     "user",
        "password": "pass",
        "database": "skolan"
    });
    let sql;
    let res;

    sql = "SELECT 1+1 AS Sum";
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
