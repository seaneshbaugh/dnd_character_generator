_character = assign {}, window.Helpers.Validator,
  strength: 0
  dexterity: 0
  constitution: 0
  intelligence: 0
  wisdom: 0
  charisma: 0
  name: ""

_character.validateNumericalityOf("strength", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })
_character.validateNumericalityOf("dexterity", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })
_character.validateNumericalityOf("constitution", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })
_character.validateNumericalityOf("intelligence", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })
_character.validateNumericalityOf("wisdom", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })
_character.validateNumericalityOf("charisma", { onlyInteger: true, greaterThanOrEqualTo: 3, lessThanOrEqualTo: 18 })

window.char = _character

setStat = (statName, statValue) ->
  if /^([0-9]+)$/.test(statValue)
    _character[statName] = Number(statValue)
  else if statValue == ""
    _character[statName] = ""

setStats = (stats) ->
  _character.strength = stats.strength
  _character.dexterity = stats.dexterity
  _character.constitution = stats.constitution
  _character.intelligence = stats.intelligence
  _character.wisdom = stats.wisdom
  _character.charisma = stats.charisma

swapStats = (statA, statB) ->
  t = _character[statA]

  _character[statA] = _character[statB]

  _character[statB] = t

CharacterGeneratorThreeFiveStore = assign {}, EventEmitter.prototype,
  getCharacter: =>
    _character

  emitCharacterUpdated: ->
    _character.validate()

    @emit "characterUpdated"

  addCharacterUpdatedListener: (callback) ->
    @addListener "characterUpdated", callback

    return

  removeCharacterUpdatedListener: (callback) ->
    @removeListener "characterUpdated", callback

    return

CharacterGeneratorAppDispatcher.register (action) ->
  switch action.actionType
    when "UPDATE_STAT"
      setStat action.statName, action.statValue

      CharacterGeneratorThreeFiveStore.emitCharacterUpdated()
    when "UPDATE_STATS"
      setStats action.stats

      CharacterGeneratorThreeFiveStore.emitCharacterUpdated()
    when "SWAP_STATS"
      swapStats action.statA, action.statB

      CharacterGeneratorThreeFiveStore.emitCharacterUpdated()

  return

window.CharacterGeneratorThreeFiveStore = CharacterGeneratorThreeFiveStore
