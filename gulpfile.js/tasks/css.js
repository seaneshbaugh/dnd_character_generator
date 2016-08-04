"use strict";

const config = require("../config");

if (!config.tasks.css) {
  return;
}

const browserSync = require("browser-sync");
const gulp = require("gulp");
const autoprefixer = require("gulp-autoprefixer");
const cssnano = require("gulp-cssnano");
const gulpIf = require("gulp-if");
const sass = require("gulp-sass");
const sourcemaps = require("gulp-sourcemaps");
const path = require("path");
const handleErrors = require("../lib/handleErrors");

const paths = {
  "src": [path.join(config.root.src, config.tasks.css.src, `/**/*.{${config.tasks.css.extensions}}`)],
  "dest": path.join(config.root.dest, config.tasks.css.dest)
};

const cssTask = function() {
  return gulp.src(paths.src).
    pipe(gulpIf(!global.production, sourcemaps.init())).
    pipe(sass(config.tasks.css.sass)).
    on("error", handleErrors).
    pipe(autoprefixer(config.tasks.css.autoprefixer)).
    pipe(gulpIf(global.production, cssnano({"autoprefixer": false}))).
    pipe(gulpIf(!global.production, sourcemaps.write())).
    pipe(gulp.dest(paths.dest)).
    pipe(browserSync.stream());
};

gulp.task("css", cssTask);

module.exports = cssTask;
