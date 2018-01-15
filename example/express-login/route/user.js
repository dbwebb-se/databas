/**
 * Route for user.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const user       = require("../src/user.js");
const sitename   = "| The Bank";

module.exports = router;

router.get("/login", (req, res) => {
    let data = {
        title: `Login ${sitename}`,
        user: req.session.acronym || null
    };

    res.render("user/login", data);
});

router.post("/login", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    let result = await user.login(req.body.user, req.body.password);

    if (result && result[0] && result[0].acronym) {
        console.info(`Successful login, setting user ${result[0].acronym} in session.`);
        req.session.acronym = result[0].acronym;
    }
    res.redirect("/user/status");
});

router.get("/status", (req, res) => {
    let data = {
        title: `Login status ${sitename}`,
        user: req.session.acronym || null,
        session: req.session
    };

    res.render("user/status", data);
});

router.get("/logout", (req, res) => {
    let data = {
        title: `Prepare to logout ${sitename}`,
        user: req.session.acronym || null
    };

    res.render("user/logout", data);
});

router.post("/logout", (req, res) => {
    console.info(`Logging out user '${req.session.acronym}'.`);
    delete req.session.acronym;

    res.redirect("/user/login");
});
