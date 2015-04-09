_allowManualEntry = false

_statSelectors =
  "0": "strength",
  "1": "dexterity",
  "2": "constitution",
  "3": "intelligence",
  "4": "wisdom",
  "5": "charisma"

_diceMode = "standard"

setDiceMode = (mode) ->
  _diceMode = mode

  if _diceMode == "point-buy" or _diceMode == "simple-entry"
    _allowManualEntry = true
  else
    _allowManualEntry = false

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
  getAllowManualEntry: =>
    _allowManualEntry

  getDiceMode: =>
    _diceMode

  getStatSelectors: =>
    _statSelectors

  emitDiceModeChanged: ->
    @emit "diceModeChanged"

  emitStatSelectorChanged: ->
    @emit "statSelectorChanged"

  addStatSelectorChangedListener: (callback) ->
    @addListener "statSelectorChanged", callback

    return

  removeStatSelectorChangedListener: (callback) ->
    @removeListener "statSelectorChanged", callback

    return

  addDiceModeChangedListener: (callback) ->
    @addListener "diceModeChanged", callback

    return

  removeDiceModeChangedListener: (callback) ->
    @removeListener "diceModeChanged", callback

    return

CharacterGeneratorAppDispatcher.register (action) ->
  switch action.actionType
    when "SET_DICE_MODE"
      setDiceMode action.mode

      CharacterGeneratorThreeFiveStatsSelectorStore.emitDiceModeChanged()
    when "STAT_SELECTOR_CHANGED"
      setStatSelectors action.statIndex, action.statName

      CharacterGeneratorThreeFiveStatsSelectorStore.emitStatSelectorChanged()

  return

window.CharacterGeneratorThreeFiveStatsSelectorStore = CharacterGeneratorThreeFiveStatsSelectorStore
