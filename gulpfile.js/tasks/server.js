/* eslint multiline-ternary: "off" */
/* eslint no-ternary: "off" */
/* eslint no-process-env: "off" */

"use strict";

const compression = require("compression");
const express = require("express");
const gulp = require("gulp");
const gulpUtil = require("gulp-util");
const logger = require("morgan");
const path = require("path");
const config = require("../config");

const defaultPort = 3000;

const settings = {
  "root": path.resolve(process.cwd(), config.root.dest),
  "port": process.env.PORT || defaultPort,
  "logLevel": process.env.NODE_ENV ? "combined" : "dev",
  "staticOptions": {
    "extensions": ["html"],
    "maxAge": "31556926"
  }
};

const serverTask = function() {
  const url = `http://localhost:${settings.port}`;

  express().
    use(compression()).
    use(logger(settings.logLevel)).
    use("/", express.static(settings.root, settings.staticOptions)).
    listen(settings.port);

  gulpUtil.log(`production server started on ${gulpUtil.colors.green(url)}`);
};

gulp.task("server", serverTask);

module.exports = serverTask;
