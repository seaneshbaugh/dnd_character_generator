CharacterGeneratorThreeFiveSimpleEntryStatus = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  render: ->
    sum = @_stats().reduce ((sum, stat) -> sum + (stat or 0)), 0

    `<div>
      {sum} points total.<br />
      Some campaigns recommend 75 for adventurers.
    </div>`

  _stats: ->
    [
      @props.character.strength
      @props.character.dexterity
      @props.character.constitution
      @props.character.intelligence
      @props.character.wisdom
      @props.character.charisma
    ]

window.CharacterGeneratorThreeFiveSimpleEntryStatus = CharacterGeneratorThreeFiveSimpleEntryStatus
