"use strict";

const React = require("react");
const ReactDOM = require("react-dom");
const Redux = require("redux");
const HelloWorld = require("./components/hello_world");
const GreetingReducer = require("./reducers/greeting_reducer");

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
    const state = {
      "name": ""
    };

    window.greetingStore = Redux.createStore(GreetingReducer, state);

    ReactDOM.render(<HelloWorld test="rofl" lol={123} store={window.greetingStore} />, node);
  }
});
