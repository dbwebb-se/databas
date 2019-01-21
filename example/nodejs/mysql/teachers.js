/**
 * Show teachers and their departments.
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

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    // // Output raw resultset
    // console.info(res);

    // // Output resultset as JSON
    // let data;
    //
    // data = JSON.stringify(res, null, 4);
    // console.info(data);

    // // Loop through each row the resultset
    // for (const row of res) {
    //     console.info(row);
    // }

    // Output as formatted text in table
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
    console.info(str);


    db.end();
})();
