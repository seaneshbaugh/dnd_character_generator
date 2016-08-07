"use strict";

// const ghPages = require("gulp-gh-pages");
const gulp = require("gulp");
// const open = require("open");
const os = require("os");
const path = require("path");
const config = require("../config");
const npmPackage = require("../../package.json");

const settings = {
  "url": npmPackage.homepage,
  "src": path.join(config.root.dest, "/**/*"),
  "ghPages": {
    "cacheDir": path.join(os.tmpdir(), npmPackage.name)
  }
};

const deployTask = function() {
  return gulp.src(settings.src).
    // pipe(ghPages(settings.ghPages)).
    on("end", () => {
      // open(settings.url);
    });
};

gulp.task("deploy", ["production"], deployTask);

module.exports = deployTask;
