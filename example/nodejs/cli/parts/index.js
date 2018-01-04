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

    rl.on("close", process.exit);
    rl.on("line", (line) => {
        line = line.trim();
        switch (line) {
            case "quit":
            case "exit":
                process.exit();
                break;
            case "help":
            case "menu":
                showMenu();
                break;
            case "init":
                makeInit(game);
                break;
            case "cheat":
                makeCheat(game);
                break;
            default:
                makeGuess(game, line);
        }
        rl.prompt();
    });
})();



/**
 * Show the menu on that can be done.
 *
 * @returns {void}
 */
function showMenu() {
    console.info(
        ` You can choose from the following commands.\n`
        + `  exit, quit, ctrl-d - to exit the program.\n`
        + `  help, menu - to show this menu.\n`
        + `  cheat      - show the current number.\n`
        + `  init       - randomize a new number.\n`
        + `  anything else is treated as a guess.`
    );
}



/**
 * Init the game and guess on (another) number.
 *
 * @param {Game} game The current game being played.
 *
 * @returns {void}
 */
function makeInit(game) {
    game.init();
    console.info(` I am know thinking of another number.`);
}



/**
 * Check the number current being used as target.
 *
 * @param {Game} game The current game being played.
 *
 * @returns {void}
 */
function makeCheat(game) {
    console.info(` I am thinking of number ${game.cheat()}`);
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
    guess = Number.parseInt(guess);

    if (game.check(guess)) {
        console.info(` Congratulations! You guessed the number I thought of.`);
        return;
    }

    console.info(` Wrong! The number is ${game.compare(guess)}.`);
}
