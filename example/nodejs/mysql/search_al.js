/**
 * Show teachers and their departments.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("./config.json");



/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let search;

    search = "al";
    str = await searchTeachers(db, search);
    console.info(str);

    db.end();
})();



/**
 * Output resultset as formatted table with details on a teacher.
 *
 * @async
 * @param {connection} db     Database connection.
 * @param {string}     search String to search for.
 *
 * @returns {string} Formatted table to print out.
 */
async function searchTeachers(db, search) {
    let sql;
    let res;
    let str;
    let like = `%${search}%`;

    console.info(`Searching for: ${search}`);

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
        ORDER BY akronym;
    `;
    res = await db.query(sql, [like, like, like, like, search]);
    str = teacherAsTable(res);
    return str;
}



/**
 * Output resultset as formatted table with details on a teacher.
 *
 * @param {RowDataPacket} res Resultset with details on a teacher.
 *
 * @returns {string} Formatted table to print out.
 */
function teacherAsTable(res) {
    let str;

    str  = "+-----------+---------------------+-----------+----------+\n";
    str += "| Akronym   | Namn                | Avdelning |   Lön    |\n";
    str += "|-----------|---------------------|-----------|----------|\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(10);
        str += "| ";
        str += row.lon.toString().padStart(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+-----------+----------+\n";

    return str;
}
