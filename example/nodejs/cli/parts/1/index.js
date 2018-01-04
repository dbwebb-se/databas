/**
 * Guess my number, a sample CLI client.
 */
"use strict";

/**
 * Main function.
 * @returns void
 */
(function() {
    // Read from commandline
    const readline = require("readline");
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    // Ask question and handle answer in arrow function callback.
    rl.question("Guess my number: ", (guess) => {
        let thinking;
        let message;

        thinking = Math.round(Math.random() * 100 + 1);
        guess = Number.parseInt(guess);
        message = `I'm thinking of number ${thinking}.\n`
            + `Youre guess is ${guess}.\n`
            + `You guessed right? `
            + (thinking === guess);
        console.info(message);

        rl.close();
    });
})();
