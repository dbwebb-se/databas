/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    login: login
};

const mysql  = require("promise-mysql");
const config = require("../config/db/bank.json");
let db;



/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();



/**
 * Login using username and password.
 *
 * @async
 * @param {string} username The username to use for login.
 * @param {string} password The password to use for login.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function login(username, password) {
    let sql = `CALL loginUser(?, ?);`;
    let res;

    res = await db.query(sql, [username, password]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
