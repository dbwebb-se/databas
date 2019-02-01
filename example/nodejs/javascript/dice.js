/**
 * A module for a dice.
 */
"use strict";

class Dice {
    /**
     * @constructor
     */
    constructor() {
        this.dice = null;
    }



    /**
     * Roll the dice and remember tha value of the rolled dice.
     *
     * @param {integer} faces The number of faces of the dice, defaults to 6.
     *
     * @returns {integer} The value of the rolled dice min=1 and max=faces.
     */
    roll(faces=6) {
        this.dice = Math.floor(Math.random() * faces + 1);
        return this.dice;
    }



    /**
     * Get the value of the last rolled dice.
     *
     * @returns {integer} The value of the last rolled dice.
     */
    lastRoll() {
        return this.dice;
    }



    /**
     * When someone is printing this object, what should it look like?
     *
     * @returns {string} The value of the last rolled dice.
     */
    toString() {
        return this.dice;
    }
}

module.exports = Dice;
