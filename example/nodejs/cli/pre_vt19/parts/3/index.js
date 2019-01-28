/**
 * Guess my number, a sample CLI client.
 */
"use strict";

/**
 * Main function.
 * @returns void
 */
(function() {
    const readline = require("readline");
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    const Game = require("./game.js");
    let game = new Game();

    game.init();

    rl.setPrompt("Guess my number: ");
    rl.prompt();

    rl.on("close", exitProgram);
    rl.on("line", (line) => {
        line = line.trim();
        switch (line) {
            case "quit":
            case "exit":
                exitProgram();
                break;
            default:
                makeGuess(game, line);
        }
        rl.prompt();
    });
})();



/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting");
    process.exit(code);
}



/**
 * Guess the number and check if its correct.
 *
 * @param {Game}   game  The current game being played.
 * @param {number} guess The number being guessed.
 *
 * @returns {void}
 */
function makeGuess(game, guess) {
    let message;
    let thinking = game.cheat();

    guess = Number.parseInt(guess);
    message = `I'm thinking of number ${thinking}.\n`
        + `Youre guess is ${guess}.\n`
        + `You guessed right? `
        + game.check(guess);
    console.info(message);
}
