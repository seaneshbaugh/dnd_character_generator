/* eslint global-require: "off" */

"use strict";

const gulp = require("gulp");
const watch = require("gulp-watch");
const path = require("path");
const config = require("../config");

const watchTask = function() {
  const watchableTasks = ["css", "fonts", "html", "images"];

  watchableTasks.forEach((taskName) => {
    const task = config.tasks[taskName];

    if (task) {
      const glob = path.join(config.root.src, task.src, `**/*.{${task.extensions.join(",")}}`);

      watch(glob, () => {
        require(`./${taskName}`)();
      });
    }
  });
};

gulp.task("watch", ["browserSync"], watchTask);

module.exports = watchTask;
