"use strict";

const config = require("../config");

if (!config.tasks.js) {
  return;
}

const path = require("path");
const webpack = require("webpack");
const pathToUrl = require("./pathToUrl");
const webpackManifest = require("./webpackManifest");

module.exports = function(env) {
  const jsSrc = path.resolve(config.root.src, config.tasks.js.src);

  const jsDest = path.resolve(config.root.dest, config.tasks.js.dest);

  const publicPath = pathToUrl(config.tasks.js.dest, "/");

  const extensions = config.tasks.js.extensions.map((extension) => `.${extension}`);

  const rev = config.tasks.production.rev && env === "production";

  const filenamePattern = (() => {
    if (rev) {
      return "[name]-[hash].js";
    }

    return "[name].js";
  })();

  const webpackConfig = {
    "context": jsSrc,
    "plugins": [],
    "resolve": {
      "root": jsSrc,
      "extensions": [""].concat(extensions)
    },
    "module": {
      "loaders": [
        {
          "test": /\.js$/,
          "loader": "babel-loader",
          "exclude": /node_modules/,
          "query": config.tasks.js.babel
        }
      ]
    }
  };

  if (env === "development") {
    webpackConfig.devtool = "inline-source-map";

    // Create new entries object with webpack-hot-middleware added
    for (const key in config.tasks.js.entries) {
      if (Reflect.apply({}.hasOwnProperty, config.tasks.js.entries, [key])) {
        const entry = config.tasks.js.entries[key];

        config.tasks.js.entries[key] = ["webpack-hot-middleware/client?&reload=true"].concat(entry);
      }
    }

    webpackConfig.plugins.push(new webpack.HotModuleReplacementPlugin());
  }

  if (env !== "test") {
    // Karma doesn"t need entry points or output settings
    webpackConfig.entry = config.tasks.js.entries;

    webpackConfig.output = {
      "path": path.normalize(jsDest),
      "filename": filenamePattern,
      "publicPath": publicPath
    };

    if (config.tasks.js.extractSharedJs) {
      // Factor out common dependencies into a shared.js
      webpackConfig.plugins.push(
        new webpack.optimize.CommonsChunkPlugin({
          "name": "shared",
          "filename": filenamePattern
        })
      );
    }
  }

  if (env === "production") {
    if (rev) {
      webpackConfig.plugins.push(new webpackManifest(publicPath, config.root.dest));
    }

    webpackConfig.plugins.push(
      new webpack.DefinePlugin({"process.env": {"NODE_ENV": JSON.stringify("production")}}),
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.UglifyJsPlugin(),
      new webpack.NoErrorsPlugin()
    );
  }

  return webpackConfig;
};
