/**
 * Show off using console.table()
 */
"use strict";

/* eslint-disable */

// Prepare a dice hand to hold the dices (its an array)
let hand = [];

// Add the dices to the dice hand and roll them once
for (let i=0; i<5; i++) {
    hand[i] = Math.round(Math.random() * 6 + 1);
}

// A array
console.table(hand);

// Using header values
console.table([
    { a: 1, b: 'Y' },
    { a: 'Z', b: 2 }
]);

// A larger table
const structDatas = [
  { handler: 'http', endpoint: 'http://localhost:3000/path', method: 'ALL' },
  { handler: 'event', endpoint: 'http://localhost:3000/event', method: 'POST' },
  { handler: 'GCS', endpoint: 'http://localhost:3000/GCS', method: 'POST' }
];
console.table(structDatas);

// Table with header in first column
const array = [{myId: 42, name: 'John', color: 'red'}, {myId: 1337, name: 'Jane', color: 'blue'}];

const transformed = array.reduce(
    (acc, {myId, ...x}) => {
        acc[myId] = x;
        return acc
    },
{});
console.log(transformed);
console.table(transformed);
