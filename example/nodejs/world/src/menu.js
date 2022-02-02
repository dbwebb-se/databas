/**
 * Create the menu for a console application.
 */
module.exports = {
    start: start
};

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const db = require('./database.js');

/**
 * Start up the menu and show the prompt.
 *
 * @returns {void}
 */
function start() {
    rl.on('close', exitProgram);
    rl.on('line', handleInput);
    rl.setPrompt('[prompt]: ');
    rl.prompt();
}

/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
async function handleInput(line) {
    let args;

    line = line.trim();
    args = line.split(' ');

    if (args[0]) {
        switch (args[0]) {
            case 'quit':
            case 'exit':
                process.exit();
                break;
            case 'help':
            case 'menu':
                showMenu();
                break;
            case 'command':
                doCommand(line);
                break;
            case 'select':
                await doSelect();
                break;
            case 'country':
                await doSelectCountry();
                break;
            case 'city':
                await doSelectCity();
                break;
            case 'search':
                if (args.length != 2) {
                    console.info('!!! You need to add a one search string.');
                    break;
                }
                await doSearchCountry(args[1]);
                break;
            default:
                unknownCommand();
        }
    }

    rl.prompt();
}

/**
 * Do the command.
 *
 * @returns {void}
 */
async function doSelect() {
    let res = await db.selectOnePlusOne();

    console.table(res);
}

/**
 * Do the command.
 *
 * @returns {void}
 */
async function doSelectCountry() {
    let res = await db.selectCountry();

    console.table(res);
}

/**
 * Do the command.
 *
 * @returns {void}
 */
async function doSelectCity() {
    let res = await db.selectCity();

    console.table(res);
}

/**
 * Do the command.
 *
 * @returns {void}
 */
async function doSearchCountry(search) {
    let res = await db.searchCountry(search);

    console.table(res);
}

/**
 * Show the menu on that can be done.
 *
 * @returns {void}
 */
function showMenu() {
    console.info(
        ' You can choose from the following commands.\n' +
        '  exit, quit, ctrl-d - Exit the program.\n' +
        '  help, menu   - Show this menu.\n' +
        '  select       - Connect to the database and do a simple select.\n' +
        '  city         - Show some cities.\n' +
        '  country      - Show some countries.\n' +
        '  search <str> - Show countries matching search string.\n' +
        '  <command>    - Do a command....\n'
    );
}

/**
 * Show text on unknown command.
 *
 * @returns {void}
 */
function unknownCommand() {
    console.info(' Unknown command. Write \'help\' to get a menu.\n');
}

/**
 * Show text on unknown command.
 *
 * @returns {void}
 */
function doCommand() {
    console.info(' Do some command. Implement this to make it happen');
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

    console.info('Exiting with status code ' + code);
    process.exit(code);
}
