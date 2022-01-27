/**
 * Connect and query the database.
 */
module.exports = {
  start: start
}

const mysql  = require("promise-mysql");
const config = require("../config/db/world.json");
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


function start() {
    console.log("hi")
}
