/**
 * Show off using https://www.npmjs.com/package/console-table-printer
 */
"use strict";

/* eslint-disable */

const { printTable } = require('console-table-printer');
const { Table } = require('console-table-printer');

// Prepare a dice hand to hold the dices (its an array)
let hand = [];

// Add the dices to the dice hand and roll them once
for (let i=0; i<5; i++) {
    hand[i] = {
        roll: i,
        value: Math.round(Math.random() * 6 + 1)
    };
}

// A array
printTable(hand);

//Create a table
const testCases = [
  { index: 3, text: 'I would like some gelb bananen bitte', value: 100 },
  { index: 4, text: 'I hope batch update is working', value: 300 },
];
 
//print
printTable(testCases);



// A table instance
//Create a table
let p = new Table();
 
//add rows with color
p.addRow({ index: 1, text: 'red wine please', value: 10.212 });
p.addRow({ index: 2, text: 'green gemuse please', value: 20.0 });
p.addRows([
  //adding multiple rows are possible
  { index: 3, text: 'gelb bananen bitte', value: 100 },
  { index: 4, text: 'update is working', value: 300 },
]);
 
//print
p.printTable();



// Colors
p = new Table();
p.addRow({ index: 1, text: 'red wine', value: 10.212 }, { color: 'red' });
p.addRow({ index: 2, text: 'green gemuse', value: 20.0 }, { color: 'green' });
p.addRow({ index: 3, text: 'gelb bananen', value: 100 }, { color: 'yellow' });
p.printTable();



// Create table object with control
p = new Table({
  style: 'fatBorder', //style of border of the table
  columns: [
    { name: 'column1', alignment: 'left' }, //with alignment
    { name: 'column2', alignment: 'right' },
    { name: 'column3' },
  ],
});
p.addRow({ column1: 1, column2: 2, column3: 3});
p.addRow({ column1: 4, column2: 5, column3: 6});
p.addRow({ column1: 7, column2: 8, column3: 9});
p.printTable();
