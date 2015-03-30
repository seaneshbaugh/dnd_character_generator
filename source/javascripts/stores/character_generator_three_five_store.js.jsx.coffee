_character =
  strength: 0
  dexterity: 0
  consitution: 0
  intelligence: 0
  wisdom: 0
  charisma: 0

setStats = (stats) ->
  _character.strength = stats.strength
  _character.dexterity = stats.dexterity
  _character.consitution = stats.constitution
  _character.intelligence = stats.intelligence
  _character.wisdom = stats.wisdom
  _character.charisma = stats.charisma

CharacterGeneratorThreeFiveStore = assign {}, EventEmitter.prototype,
  getCharacter: =>
    _character

  emitCharacterUpdated: ->
    @emit "characterUpdated"

  addCharacterUpdatedListener: (callback) ->
    @addListener "characterUpdated", callback

    return

  removeCharacterUpdatedListener: (callback) ->
    @removeListener "characterUpdated", callback

    return

CharacterGeneratorAppDispatcher.register (action) ->
  switch action.actionType
    when "UPDATE_STATS"
      setStats action.stats

      CharacterGeneratorThreeFiveStore.emitCharacterUpdated()

  return

window.CharacterGeneratorThreeFiveStore = CharacterGeneratorThreeFiveStore
