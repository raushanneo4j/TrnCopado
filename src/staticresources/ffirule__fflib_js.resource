
// fflib_js
// This file is for holding FFDC specific common javascript functions.
/**
 * IIFE (immediately invoked function expression) to build the global "fflib" object with utility functions;
 *
 * @param win Global scope (window)
 * @param lib Name of the global "fflib" object
 * @param one Name of the global "sforce" object
 */
(function(win, lib, one) {
    // access the "fflib" object, create if does not exist;
    lib = win[lib] = win[lib] || {};

    // access the "sforce.one" object;
    one = (win[one] || {}).one;

    /**
     * Navigates to the specified URL.
     *
     * @param url The URL to navigate to.
     */
    lib.navigateToURL = function (url) {
        if (one) {
            one.navigateToURL(url);
        } else {
            win.top.location = url;
        }
    }
})(this, 'fflib', 'sforce');
