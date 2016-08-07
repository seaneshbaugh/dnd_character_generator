"use strict";

const config = require("../config");

const assetTasks = ["fonts", "images"];

const codeTasks = ["html", "css", "js"];

module.exports = function(env) {
  const matchFilter = function(task) {
    if (config.tasks[task]) {
      if (task === "js") {
        if (env === "production") {
          return "webpack:production";
        }

        return false;
      }

      return task;
    }

    return false;
  };

  const exists = function(value) {
    return Boolean(value);
  };

  return {
    "assetTasks": assetTasks.map(matchFilter).filter(exists),
    "codeTasks": codeTasks.map(matchFilter).filter(exists)
  };
};
