/**
 * Update the salary for a teacher.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("./config.json");

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Promisify rl.question to question
const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};
const question = util.promisify(rl.question);



/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let acronym;
    let salary;

    console.info("Update salary for teacher.");
    acronym = await question("Enter acronym: ");
    salary = await question("Enter salary: ");
    await updateTeacherSalary(db, acronym, salary);

    rl.close();
    db.end();
})();



/**
 * Uptade the salary of a teacher.
 *
 * @async
 * @param {connection} db      Database connection.
 * @param {string}     acronym Who to update.
 * @param {string}     salary  Value to update with.
 *
 * @returns {void}
 */
async function updateTeacherSalary(db, acronym, salary) {
    let sql;
    let res;

    console.info(`Updating salary to ${salary} for ${acronym}`);

    sql = `
        UPDATE larare
        SET
            lon = ?
        WHERE
            akronym = ?
        ;
    `;
    res = await db.query(sql, [salary, acronym]);
    console.log(res);
}
