CharacterGeneratorThreeFiveActions =
  setStat: (statName, statValue) ->
    CharacterGeneratorAppDispatcher.dispatch
      actionType: "UPDATE_STAT"
      statName: statName
      statValue: statValue

    return

  rollStatDice: ->
    rolls = Helpers.StatGenerator.roll(CharacterGeneratorThreeFiveStatsSelectorStore.getDiceMode())

    stats =
      strength: rolls[0]
      dexterity: rolls[1]
      constitution: rolls[2]
      intelligence: rolls[3]
      wisdom: rolls[4]
      charisma: rolls[5]

    CharacterGeneratorAppDispatcher.dispatch
      actionType: "UPDATE_STATS"
      stats: stats

    return

window.CharacterGeneratorThreeFiveActions = CharacterGeneratorThreeFiveActions
