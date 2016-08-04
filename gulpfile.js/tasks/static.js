"use strict";

const gulp = require("gulp");
const changed = require("gulp-changed");
const path = require("path");
const config = require("../config");

const paths = {
  "src": [path.join(config.root.src, config.tasks.static.src, "/**")],
  "dest": path.join(config.root.dest, config.tasks.static.dest)
};

const staticTask = function() {
  return gulp.src(paths.src).
    pipe(changed(paths.dest)).
    pipe(gulp.dest(paths.dest));
};

gulp.task("static", staticTask);

module.exports = staticTask;
