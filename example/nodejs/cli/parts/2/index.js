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

// Import the game module
const Game = require("./game.js");
const game = new Game();



/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    let thinking;
    let guess;
    let match;
    let message;

    game.init();
    thinking = game.cheat();

    guess = await question("Guess my number: ");
    guess = Number.parseInt(guess);
    match = game.check(guess);
    message = `I'm thinking of number ${thinking}.\n`
        + `Youre guess is ${guess}.\n`
        + `You guessed right? `
        + (match);
    console.info(message);

    rl.close();
})();
