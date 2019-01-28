/**
 * Guess my number, a sample CLI client.
 */
"use strict";

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
    let thinking;
    let message;
    let guess;

    thinking = Math.round(Math.random() * 100 + 1);

    guess = await question("Guess my number: ");
    guess = Number.parseInt(guess);
    message = `I'm thinking of number ${thinking}.\n`
        + `Youre guess is ${guess}.\n`
        + `You guessed right? `
        + (thinking === guess);
    console.info(message);

    rl.close();
})();
