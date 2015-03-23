_generator = undefined;

selectGenerator = (version) ->
  switch version
    when "3.5" then _generator = `<GeneratorThreeFive />`
    when "4" then _generator = `<GeneratorFour />`
    when "Next" then _generator = `<GeneratorNext />`
    else throw new Error "Character Generator version must be 3.5, 4, or Next."

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
