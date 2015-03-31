_statSelectors =
  "0": "strength",
  "1": "dexterity",
  "2": "constitution",
  "3": "intelligence",
  "4": "wisdom",
  "5": "charisma"

setStatSelectors = (statIndex, statName) ->
  oldStatName = null

  for index, name of _statSelectors
    if index == statIndex
      oldStatName = name

  oldStatIndex = null

  for index, name of _statSelectors
    if name == statName
      oldStatIndex = index

  _statSelectors[statIndex] = statName

  _statSelectors[oldStatIndex] = oldStatName

CharacterGeneratorThreeFiveStatsSelectorStore = assign {}, EventEmitter.prototype,
  getStatSelectors: =>
    _statSelectors

  emitStatSelectorChanged: ->
    @emit "statSelectorChanged"

  addStatSelectorChangedListener: (callback) ->
    @addListener "statSelectorChanged", callback

    return

  removeStatSelectorChangedListener: (callback) ->
    @removeListener "statSelectorChanged", callback

    return

CharacterGeneratorAppDispatcher.register (action) ->
  switch action.actionType
    when "STAT_SELECTOR_CHANGED"
      setStatSelectors action.statIndex, action.statName

      CharacterGeneratorThreeFiveStatsSelectorStore.emitStatSelectorChanged()

  return

window.CharacterGeneratorThreeFiveStatsSelectorStore = CharacterGeneratorThreeFiveStatsSelectorStore
