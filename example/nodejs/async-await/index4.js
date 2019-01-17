/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);



/**
 * The main function, needed to wrap async await that can not be used
 * on module level.
 *
 * @async
 * @returns void
 */
async function main() {
    const path = "file.txt";
    let data;

    console.info("1) Program is starting up!");

    //data = getFileContentCallback(path);
    //data = getFileContentSync(path);
    data = await getFileContentPromise(path);
    console.info(data);

    console.info("3) End of the program!");
}
main();



/* eslint-disable no-unused-vars */

/**
 * Return the content of the file, using a promosiified variant.
 *
 * @param {string}   The path to the file to read.
 *
 * @returns {string} The content of the file.
 */
async function getFileContentPromise(filename) {
    let data;

    data = await readFile(filename, "utf-8");
    return data;
}



/**
 * Return the content of the file, using callback, which will not work
 * since the function will end before the callback is executed.
 *
 * @param {string}   The path to the file to read.
 *
 * @returns {string} The content of the file.
 */
function getFileContentCallback(filename) {
    fs.readFile(filename, "utf-8", (err, data) => {
        return data;
    });
}



/**
 * Return the content of the file, synced version which works.
 *
 * @param {string}   The path to the file to read.
 *
 * @returns {string} The content of the file.
 */
function getFileContentSync(filename) {
    let data;

    data = fs.readFileSync(filename, "utf-8");
    return data;
}
