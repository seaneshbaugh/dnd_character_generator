"use strict";

const path = require("path");

module.exports = function(...args) {
  // Normalizes Windows file paths to valid url paths
  return Reflect.apply(path.join, this, args).replace(/\\/g, "/");
};
