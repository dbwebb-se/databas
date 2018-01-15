/**
 * Route for today.
 */
"use strict";

const express = require("express");
const router  = express.Router();

router.get("/", (req, res) => {
    let data = {};

    data.date = new Date();

    res.render("today", data);
});

module.exports = router;
