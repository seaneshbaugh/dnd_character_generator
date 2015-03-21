_generator = undefined;

selectGenerator = (version) ->
  _generator = version

  return

CharacterGeneratorAppStore = assign {}, EventEmitter.prototype,
  getGenerator: =>
    _generator

  emitSelectGenerator: ->
    @emit "selectGenerator"

  addSelectGeneratorListener: (callback) ->
    @addListener "selectGenerator", callback

    return

  removeSelectGeneratorListener: (callback) ->
    @removeListener "selectGenerator", callback

    return


CharacterGeneratorAppDispatcher.register (action) ->
  switch action.actionType
    when "CHARACTER_GENERATOR_SELECT"
      selectGenerator action.version

      CharacterGeneratorAppStore.emitSelectGenerator()

  return

window.CharacterGeneratorAppStore = CharacterGeneratorAppStore
