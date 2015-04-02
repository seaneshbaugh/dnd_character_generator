CharacterGeneratorThreeFiveStatSelectorActions =
  setDiceMode: (mode) ->
    CharacterGeneratorAppDispatcher.dispatch
      actionType: "SET_DICE_MODE"
      mode: mode

    return

  setStatSelectors: (statIndex, statName) ->
    statSelectors = CharacterGeneratorThreeFiveStatsSelectorStore.getStatSelectors()

    oldStatName = null

    for index, name of statSelectors
      if index == statIndex
        oldStatName = name

    CharacterGeneratorAppDispatcher.dispatch
      actionType: "SWAP_STATS"
      statA: statName
      statB: oldStatName

    CharacterGeneratorAppDispatcher.dispatch
      actionType: "STAT_SELECTOR_CHANGED"
      statIndex: statIndex
      statName: statName

    return

window.CharacterGeneratorThreeFiveStatSelectorActions = CharacterGeneratorThreeFiveStatSelectorActions
