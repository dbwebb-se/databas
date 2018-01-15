/**
 * General middleware.
 */
"use strict";

module.exports = {
    logIncomingToConsole: logIncomingToConsole,
    authenticatedOrLogin: authenticatedOrLogin
};



/**
 * Check that user is authenticated or redirect to login.
 *
 * @return {void}
 */
function authenticatedOrLogin(req, res, next) {
    //console.info("Authentication check through session.");

    if (req.session && req.session.acronym) {
        return next();
    }

    console.info("User is not authenticated.");
    console.info("Redirecting to /user/login.");
    res.redirect("/user/login");
}



/**
 * Log incoming requests to console to see who accesses the server
 * on what route.
 *
 * @param {Request}  req  The incoming request.
 * @param {Response} res  The outgoing response.
 * @param {Function} next Next to call in chain of middleware.
 *
 * @returns {void}
 */
function logIncomingToConsole(req, res, next) {
    console.info(`Got request on ${req.path} (${req.method}).`);
    next();
}
