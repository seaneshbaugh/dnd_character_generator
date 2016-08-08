"use strict";

const React = require("react");
const ReactDOM = require("react-dom");
const Redux = require("redux");
const thunk = require("redux-thunk").default;
const HelloWorld = require("./components/hello_world");
const CharacterGenerator = require("./components/character_generator");
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

    window.greetingStore = Redux.createStore(GreetingReducer, state, Redux.applyMiddleware(thunk));

    ReactDOM.render(<CharacterGenerator store={window.greetingStore} />, node);
  }
});
