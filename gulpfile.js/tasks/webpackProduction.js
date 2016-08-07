"use strict";

const config = require("../config");

if (!config.tasks.js) {
  return;
}

const gulp = require("gulp");
const webpack = require("webpack");
const logger = require("../lib/compileLogger");
const webpackConfig = require("../lib/webpack-multi-config")("production");

const webpackProductionTask = function(callback) {
  webpack(webpackConfig, (error, stats) => {
    logger(error, stats);

    callback();
  });
};

gulp.task("webpack:production", webpackProductionTask);

module.exports = webpackProductionTask;
