/**
 * Search and show teachers and their departments.
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

    // Read from commandline
    const readline = require('readline');
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // Ask question and handle answer in async arrow function callback.
    rl.question("What to search for? ", async (search) => {
        let str;

        str = await searchTeachers(db, search);
        console.info(str);

        rl.close();
        db.end();
    });
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
        	-- *
            season,
            e.id AS episode,
            e.title As title,
            DATE_FORMAT(aired, "%Y-%m-%d") AS aired 
        FROM \`show\` AS s
        	JOIN \`season\`AS se
        		ON s.id = se.\`show\`
        	JOIN \`episode\`AS e
        		ON se.id = e.season
        WHERE
        	0
            OR e.id LIKE ?
        	OR e.title LIKE ?
        	OR DATE_FORMAT(e.aired, "%Y %M %d") LIKE ?
        ;
    `;
    // res = await db.query(sql, [like, like, like, like, search])
    //    .catch((err) => { console.log(err); });
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

    return str;
}
