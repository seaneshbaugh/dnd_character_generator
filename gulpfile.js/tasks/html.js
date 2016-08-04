"use strict";

const config = require("../config");

if (!config.tasks.html) {
  return;
}

const browserSync = require("browser-sync");
const gulp = require("gulp");
const htmlmin = require("gulp-htmlmin");
const gulpIf = require("gulp-if");
const path = require("path");

const exclude = path.normalize(`!**/{${config.tasks.html.excludeFolders.join(",")}}/**`);

const paths = {
  "src": [path.join(config.root.src, config.tasks.html.src, `/**/*.{${config.tasks.html.extensions}}`), exclude],
  "dest": path.join(config.root.dest, config.tasks.html.dest)
};

const htmlTask = function() {
  return gulp.src(paths.src).
    pipe(gulpIf(global.production, htmlmin(config.tasks.html.htmlmin))).
    pipe(gulp.dest(paths.dest)).
    pipe(browserSync.stream());
};

gulp.task("html", htmlTask);

module.exports = htmlTask;
