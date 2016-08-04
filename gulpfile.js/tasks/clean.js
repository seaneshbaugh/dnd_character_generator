"use strict";

const del = require("del");
const gulp = require("gulp");
const config = require("../config");

const cleanTask = function(callback) {
  del([config.root.dest]).then((_paths) => {
    callback();
  });
};

gulp.task("clean", cleanTask);

module.exports = cleanTask;
