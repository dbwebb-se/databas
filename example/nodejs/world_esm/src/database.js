/**
 * Connect and query the database.
 */
export default {
    selectOnePlusOne,
    selectCountry,
    selectCity,
    searchCountry
};

import mysql from 'promise-mysql';

// Import a configuration file
import { readFileSync } from 'fs';
const dbConfigFile = new URL(
    '../config/db/world.json',
    import.meta.url
).pathname;
const config = JSON.parse(readFileSync(dbConfigFile));

let db;



/**
 * Create the connection to the database and store it.
 *
 * @returns {Array} res
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
 * Execute a simple query just to verify that the database connection works.
 *
 * @returns {Array} res
 */
async function selectOnePlusOne() {
    let sql;
    let res;

    sql = "SELECT 1+1 AS Sum";
    console.info(`Executing query:\n${sql}`);

    res = await db.query(sql);
    console.info(res);

    return res;
}

/**
 * Show some countries.
 *
 * @returns {Array} res
 */
async function selectCountry() {
    let sql;
    let res;

    sql = `
    SELECT
        Code,
        Name,
        Continent,
        Region,
        Population,
        LifeExpectancy
    FROM country
    LIMIT 7
    ;
    `;
    console.info(`Executing query:\n${sql}`);

    res = await db.query(sql);
    //console.info(res)

    return res;
}

/**
 * Show some cities.
 *
 * @returns {Array} res
 */
async function selectCity() {
    let sql;
    let res;

    sql = `
    SELECT
        *
    FROM city
    LIMIT 7
    ;
    `;
    console.info(`Executing query:\n${sql}`);

    res = await db.query(sql);
    //console.info(res)

    return res;
}

/**
 * Show some countries.
 *
 * @returns {Array} res
 */
async function searchCountry(search) {
    let sql;
    let param;
    let res;

    sql = `
    SELECT
        Code,
        Name,
        Continent,
        Region,
        Population,
        LifeExpectancy
    FROM country
    WHERE
        Code = ?
        OR Name LIKE ?
        OR Continent LIKE ?
        OR Region LIKE ?
    LIMIT 7
    ;
    `;
    param = [
        search,
        search,
        search,
        search
    ];
    console.info(`Executing query:\n${sql}`);
    console.info(`with parameter:\n${param}`);

    res = await db.query(sql, param);
    //console.info(res)

    return res;
}
