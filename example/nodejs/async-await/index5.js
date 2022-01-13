/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);

const path = "file.txt";

console.info("1) Program is starting up!");

readFile(path, "utf-8")
    .then(data => { console.info(data); })
    .catch(error => { console.error(error); });

console.info("3) End of the program!");
