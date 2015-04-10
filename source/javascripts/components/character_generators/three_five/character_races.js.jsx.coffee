CharacterGeneratorThreeFiveCharacterRaces = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  render: ->
    `<div>
      <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Human" />
      <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Dwarf" />
      <CharacterGeneratorThreeFiveCharacterRace character={this.props.character} race="Elf" />
    </div>`

window.CharacterGeneratorThreeFiveCharacterRaces = CharacterGeneratorThreeFiveCharacterRaces
