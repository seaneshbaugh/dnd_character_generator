"use strict";

const gulpUtil = require("gulp-util");
const handleErrors = require("./handleErrors");
const prettifyTime = require("./prettifyTime");

module.exports = function(err, stats) {
  if (err) {
    throw new gulpUtil.PluginError("webpack", err);
  }

  let statColor = "green";

  if (stats.compilation.warnings.length > 0) {
    statColor = "yellow";
  }

  if (stats.compilation.errors.length > 0) {
    stats.compilation.errors.forEach((error) => {
      handleErrors(error);

      statColor = "red";
    });
  } else {
    const compileTime = prettifyTime(stats.endTime - stats.startTime);

    gulpUtil.log(gulpUtil.colors[statColor](stats));

    gulpUtil.log("Compiled with", gulpUtil.colors.cyan("webpack"), "in", gulpUtil.colors.magenta(compileTime));
  }
};
