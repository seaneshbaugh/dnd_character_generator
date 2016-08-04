/* eslint no-sync: "off" */

"use strict";

if (global.production) {
  return;
}

const browserSync = require("browser-sync");
const gulp = require("gulp");
const webpack = require("webpack");
const webpackDevMiddleware = require("webpack-dev-middleware");
const webpackHotMiddleware = require("webpack-hot-middleware");
const config = require("../config");
const pathToUrl = require("../lib/pathToUrl");
const webpackMultiConfig = require("../lib/webpack-multi-config");

const browserSyncTask = function() {
  const webpackConfig = webpackMultiConfig("development");
  const compiler = webpack(webpackConfig);
  const proxyConfig = config.tasks.browserSync.proxy || null;

  if (typeof proxyConfig === "string") {
    config.tasks.browserSync.proxy = {"target": proxyConfig};
  }

  const server = config.tasks.browserSync.proxy || config.tasks.browserSync.server;

  server.middleware = [
    webpackDevMiddleware(compiler, {
      "stats": "errors-only",
      "publicPath": pathToUrl("/", webpackConfig.output.publicPath)
    }),
    webpackHotMiddleware(compiler)
  ];

  browserSync.init(config.tasks.browserSync);
};

gulp.task("browserSync", browserSyncTask);

module.exports = browserSyncTask;
