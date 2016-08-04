/* eslint no-sync: "off" */

"use strict";

const fs = require("fs");
const path = require("path");

module.exports = function(publicPath, dest, filename) {
  const manifestFilename = filename || "rev-manifest.json";

  return function() {
    this.plugin("done", (stats) => {
      const chunks = stats.toJson().assetsByChunkName;

      const manifest = {};

      for (const key in chunks) {
        if ({}.hasOwnProperty.call(chunks, key)) {
          const originalFilename = `${key}.js`;

          manifest[path.join(publicPath, originalFilename)] = path.join(publicPath, chunks[key]);
        }
      }

      fs.writeFileSync(path.join(process.cwd(), dest, manifestFilename), JSON.stringify(manifest));
    });
  };
};
