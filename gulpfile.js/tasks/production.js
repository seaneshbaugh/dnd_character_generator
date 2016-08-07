"use strict";

const gulp = require("gulp");
const gulpSequence = require("gulp-sequence");
const config = require("../config");
const getEnabledTasks = require("../lib/getEnabledTasks");

const productionTask = function(callback) {
  global.production = true;

  const tasks = getEnabledTasks("production");

  const rev = (() => {
    if (config.tasks.production.rev) {
      return "rev";
    }

    return false;
  })();

  gulpSequence("clean", tasks.assetTasks, tasks.codeTasks, rev, "static", callback);
};

gulp.task("production", productionTask);

module.exports = productionTask;
