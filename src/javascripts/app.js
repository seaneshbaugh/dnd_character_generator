"use strict";

const React = require("react");
const ReactDOM = require("react-dom");
const HelloWorld = require("./components/hello_world");

const onReady = function(completed) {
  if (document.readyState === "complete") {
    setTimeout(completed);
  } else {
    document.addEventListener("DOMContentLoaded", completed, false);
  }
};

onReady(function() {
  const node = document.getElementById("dnd-character-generator");

  if (node) {
    ReactDOM.render(<HelloWorld test="rofl" lol={123} />, node);
  }
});
