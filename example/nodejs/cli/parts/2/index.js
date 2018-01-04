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

    rl.question("Guess my number: ", (guess) => {
        let message;
        let thinking = game.cheat();

        guess = Number.parseInt(guess);
        message = `I'm thinking of number ${thinking}.\n`
            + `Youre guess is ${guess}.\n`
            + `You guessed right? `
            + game.check(guess);
        console.info(message);

        rl.close();
    });
})();
