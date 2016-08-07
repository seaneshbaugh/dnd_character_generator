/* eslint no-sync: "off" */

"use strict";

const fs = require("fs");
const path = require("path");

class ManifestPlugin {
  constructor(publicPath, dest, filename) {
    this.publicPath = publicPath;

    this.dest = dest;

    this.manifestFilename = filename || "rev-manifest.json";
  }

  apply(compiler) {
    compiler.plugin("done", (stats) => {
      const chunks = stats.toJson().assetsByChunkName;

      const manifest = {};

      for (const key in chunks) {
        if (Reflect.apply({}.hasOwnProperty, chunks, [key])) {
          const originalFilename = `${key}.js`;

          manifest[path.join(this.publicPath, originalFilename)] = path.join(this.publicPath, chunks[key]);
        }
      }

      fs.writeFileSync(path.join(process.cwd(), this.dest, this.manifestFilename), JSON.stringify(manifest));
    });
  }
}

module.exports = ManifestPlugin;
