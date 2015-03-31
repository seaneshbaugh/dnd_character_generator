CharacterGeneratorThreeFiveActions =
  setStat: (statName, statValue) ->
    CharacterGeneratorAppDispatcher.dispatch
      actionType: "UPDATE_STAT"
      statName: statName
      statValue: statValue

    return

  rollStatDice: ->
    stats =
      strength: Helpers.Dice.roll("4d6k3")
      dexterity: Helpers.Dice.roll("4d6k3")
      constitution: Helpers.Dice.roll("4d6k3")
      intelligence: Helpers.Dice.roll("4d6k3")
      wisdom: Helpers.Dice.roll("4d6k3")
      charisma: Helpers.Dice.roll("4d6k3")

    CharacterGeneratorAppDispatcher.dispatch
      actionType: "UPDATE_STATS"
      stats: stats

    return

window.CharacterGeneratorThreeFiveActions = CharacterGeneratorThreeFiveActions
