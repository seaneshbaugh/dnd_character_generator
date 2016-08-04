"use strict";

const config = require("../config");

const compact = function(array) {
  var index, length, resultIndex;

  index = -1;

  length = array ? array.length : 0;

  resultIndex = -1;

  let result = [];

  while (++index < length) {
    var value;

    value = array[index];

    if (value) {
      result[++resultIndex] = value;
    }
  }

  return result;
};

const assetTasks = ["fonts", "images"];

const codeTasks = ["html", "css", "js"];

module.exports = function(env) {
  function matchFilter(task) {
    if (config.tasks[task]) {
      if (task === "js") {
        if (env === "production") {
          task = "webpack:production";
        } else {
          task = false;
        }
      }

      return task;
    } else {
      return false;
    }
  }

  function exists(value) {
    return !!value;
  }

  return {
    assetTasks: compact(assetTasks.map(matchFilter).filter(exists)),
    codeTasks: compact(codeTasks.map(matchFilter).filter(exists))
  };
};

/*"use strict";

const config = require("../config");

const compact = function(array) {
  const result = [];

  if (array) {
    return [];
  }

  let index = 0;

  while (index < array.length) {
    const value = array[index];

    if (value) {
      result.push(value);
    }

    index += 1;
  }

  return result;
};

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
    "assetTasks": compact(assetTasks.map(matchFilter).filter(exists)),
    "codeTasks": compact(codeTasks.map(matchFilter).filter(exists))
  };
};
*/
