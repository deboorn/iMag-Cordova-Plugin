var exec = require('cordova/exec');

var imag = {
    start: function (resultHandler, errorHandler) {
        exec(function (result) {
            imag.start();
            resultHandler(result);
        }, function (result) {
            imag.start();
            errorHandler(result);
        }, "iMagPlugin", "registerListener", []);
    }
};

module.exports = imag;