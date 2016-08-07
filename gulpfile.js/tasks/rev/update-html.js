"use strict";

const gulp = require("gulp");
const path = require("path");
const revReplace = require("gulp-rev-replace");
const config = require("../../config");

// 5) Update asset references in HTML
gulp.task("update-html", () => {
  const manifest = gulp.src(path.join(config.root.dest, "/rev-manifest.json"));

  return gulp.src(path.join(config.root.dest, config.tasks.html.dest, "/**/*.html")).
    pipe(revReplace({"manifest": manifest})).
    pipe(gulp.dest(path.join(config.root.dest, config.tasks.html.dest)));
});
