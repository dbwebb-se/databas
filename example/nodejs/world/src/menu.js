/**
 * Create the menu for a console application.
 */
module.exports = {
  start: start
}

const readline = require('readline')
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

const db = require('./database.js')

/**
 * Start up the menu and show the prompt.
 *
 * @returns {void}
 */
function start () {
  rl.on('close', exitProgram)
  rl.on('line', handleInput)
  rl.setPrompt('[prompt]: ')
  rl.prompt()
}

/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
function handleInput (line) {
  line = line.trim()
  switch (line) {
    case 'quit':
    case 'exit':
      process.exit()
      break
    case 'help':
    case 'menu':
      showMenu()
      break
    case 'command':
      doCommand(line)
      break
    default:
      unknownCommand()
  }

  rl.prompt()
}

/**
 * Show the menu on that can be done.
 *
 * @returns {void}
 */
function showMenu () {
  console.info(
    ' You can choose from the following commands.\n' +
        '  exit, quit, ctrl-d - to exit the program.\n' +
        '  help, menu - to show this menu.\n' +
        '  <command>  - do a command....\n'
  )
}

/**
 * Show text on unknown command.
 *
 * @returns {void}
 */
function unknownCommand () {
  console.info(' Unknown command. Write \'help\' to get a menu.\n')
  db.start()
}

/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram (code) {
  code = code || 0

  console.info('Exiting with status code ' + code)
  process.exit(code)
}
