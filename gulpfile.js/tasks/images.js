"use strict";

const config = require("../config");

if (!config.tasks.images) {
  return;
}

const browserSync = require("browser-sync");
const gulp = require("gulp");
const changed = require("gulp-changed");
const path = require("path");

const paths = {
  "src": path.join(config.root.src, config.tasks.images.src, `/**/*.{${config.tasks.images.extensions}}`),
  "dest": path.join(config.root.dest, config.tasks.images.dest)
};

const imagesTask = function() {
  return gulp.src([paths.src]).
    pipe(changed(paths.dest)).
    pipe(gulp.dest(paths.dest)).
    pipe(browserSync.stream());
};

gulp.task("images", imagesTask);

module.exports = imagesTask;
