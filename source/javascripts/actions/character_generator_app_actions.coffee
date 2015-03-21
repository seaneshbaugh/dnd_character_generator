CharacterGeneratorAppActions =
  select: (version) ->
    CharacterGeneratorAppDispatcher.dispatch
      actionType: "CHARACTER_GENERATOR_SELECT"
      version: version

    return

window.CharacterGeneratorAppActions = CharacterGeneratorAppActions
