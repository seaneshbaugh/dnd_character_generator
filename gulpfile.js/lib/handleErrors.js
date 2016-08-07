/* eslint prefer-reflect: "off" */

"use strict";

const notify = require("gulp-notify");

module.exports = function(errorObject, _callback, ...args) {
  notify.onError(errorObject.toString().split(": ").
    join(":\n")).
    apply(this, args);

  if (typeof this.emit === "function") {
    this.emit("end");
  }
};
