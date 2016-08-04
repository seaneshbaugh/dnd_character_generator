"use strict";

const config = require("../config");

if (!config.tasks.fonts) {
  return;
}

const browserSync = require("browser-sync");
const gulp = require("gulp");
const changed = require("gulp-changed");
const path = require("path");

const paths = {
  "src": [path.join(config.root.src, config.tasks.fonts.src, `/**/*.{${config.tasks.fonts.extensions}}`)],
  "dest": path.join(config.root.dest, config.tasks.fonts.dest)
};

const fontsTask = function() {
  return gulp.src(paths.src).
    pipe(changed(paths.dest)).
    pipe(gulp.dest(paths.dest)).
    pipe(browserSync.stream());
};

gulp.task("fonts", fontsTask);

module.exports = fontsTask;
