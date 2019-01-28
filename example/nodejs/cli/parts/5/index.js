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

// // Promisify rl.question to question
// const util = require("util");
//
// rl.question[util.promisify.custom] = (arg) => {
//     return new Promise((resolve) => {
//         rl.question(arg, resolve);
//     });
// };
// const question = util.promisify(rl.question);

// Import the game module
const Game = require("./game.js");
const game = new Game();



/**
 * Main function.
 *
 * @returns void
 */
(function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    game.init();
    console.log(
        "Lets run a game of 'Guess my number'!\n"
        + "I am guessing of a number between 1 and 100.\n"
        + "Can you find out what number I'm guessing?\n"
        + "Select 'menu' for more info or 'exit' to quit.\n"
    );

    rl.setPrompt("Guess my number: ");
    rl.prompt();
})();



/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
function handleInput(line) {
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
            makeInit();
            break;
        case "cheat":
            makeCheat();
            break;
        default:
            makeGuess(line);
    }

    rl.prompt();
}



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
 * @returns {void}
 */
function makeInit() {
    game.init();
    console.info(` I am know thinking of another number.`);
}



/**
 * Check the number current being used as target.
 *
 * @returns {void}
 */
function makeCheat() {
    console.info(` I am thinking of number ${game.cheat()}`);
}



/**
 * Guess the number and check if its correct.
 *
 * @param {number} guess The number being guessed.
 *
 * @returns {void}
 */
function makeGuess(guess) {
    guess = Number.parseInt(guess);

    if (game.check(guess)) {
        console.info(` Congratulations! You guessed the number I thought of.`);
        return;
    }

    console.info(` Wrong! The number is ${game.compare(guess)}.`);
}



/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
