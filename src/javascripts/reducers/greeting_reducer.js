"use strict";

window.GREETING_UPDATE_NAME = "greeting-update-name";

const defaultState = {
  "name": ""
};

const GreetingReducer = function(state = defaultState, action) {
  const updateName = function(action) {
    const updatedState = Object.assign({}, state, {"name": action.newName});

    return updatedState;
  };

  switch(action.type) {
  case GREETING_UPDATE_NAME:
    return updateName(action);
  default:
    return state;
  }
};

module.exports = GreetingReducer;
