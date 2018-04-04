/**
 * Show teachers and their departments.
 */
"use strict";

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const mysql  = require("promise-mysql");
    const config = require("./config.json");
    const db     = await mysql.createConnection(config);
    let sql;
    let res;

    sql = `
        SELECT
            season,
            id AS episode,
            titles,
            DATE_FORMAT(aired, "%Y-%m-%d") AS aired 
        FROM episode
        ;
    `;
    res = await db.query(sql);
    //res = await db.query(sql).catch((err) => { console.log(err); });

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

    str  = "+-----------+-----------+-----------+----------+\n";
    str += "| Season    | Episode   | Title     |   Aired  |\n";
    str += "|-----------|-----------|-----------|----------|\n";
    for (const row of res) {
        str += "| ";
        str += row.season.padEnd(4);
        str += "| ";
        str += row.episode.padEnd(3);
        str += "| ";
        str += row.title.padEnd(20);
        str += "| ";
        //str += row.aired.toJSON().substring(0, 10).padEnd(8);
        str += row.aired.padEnd(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+-----------+----------+\n";
    console.info(str);


    db.end();
})();
