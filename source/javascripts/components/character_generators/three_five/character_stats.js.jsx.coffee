CharacterGeneratorThreeFiveCharacterStats = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  render: ->
    `<div className="character-stats">
      <div>Strength: {this.props.character.strength}</div>
      <div>Dexterity: {this.props.character.dexterity}</div>
      <div>Constitution: {this.props.character.consitution}</div>
      <div>Intelligence: {this.props.character.intelligence}</div>
      <div>Wisdom: {this.props.character.wisdom}</div>
      <div>Charisma: {this.props.character.charisma}</div>
    </div>`

window.CharacterGeneratorThreeFiveCharacterStats = CharacterGeneratorThreeFiveCharacterStats
