#= require jquery.min
#= require bootstrap-sprockets
#= require react
#= require assign
#= require invariant
#= require EventEmitter.min
#= require_tree ./dispatchers
#= require_tree ./stores
#= require_tree ./actions
#= require_tree ./components

$ ->
  React.render React.createElement(CharacterGeneratorApp), document.getElementById("character-generator-app")
