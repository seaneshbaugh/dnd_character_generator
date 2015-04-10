CharacterGeneratorThreeFiveCharacterRace = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired
    race: React.PropTypes.string.isRequired

  render: ->
    `<div className="radio">
      <label>
        <input checked={this.props.character.race == this.props.race} name="race" type="radio" value={this.props.race} onChange={this._onChangeRace} /> {this.props.race}
      </label>
    </div>`

  _onChangeRace: ->
    CharacterGeneratorThreeFiveActions.setRace(this.props.race)

window.CharacterGeneratorThreeFiveCharacterRace = CharacterGeneratorThreeFiveCharacterRace
