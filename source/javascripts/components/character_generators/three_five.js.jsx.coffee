getCharacterGeneratorState = ->
  character: CharacterGeneratorThreeFiveStore.getCharacter()

CharacterGeneratorThreeFive = React.createClass
  getInitialState: ->
    getCharacterGeneratorState()

  componentDidMount: ->
    CharacterGeneratorThreeFiveStore.addCharacterUpdatedListener @_onCharacterUpdated

  componentWillUnmount: ->
    CharacterGeneratorThreeFiveStore.removeCharacterUpdatedListener @_onCharacterUpdated

  render: ->
    `<div>
      <h2>3.5</h2>
      <div>Strength: {this.state.character.strength}</div>
      <div>Dexterity: {this.state.character.dexterity}</div>
      <div>Constitution: {this.state.character.consitution}</div>
      <div>Intelligence: {this.state.character.intelligence}</div>
      <div>Wisdom: {this.state.character.wisdom}</div>
      <div>Charisma: {this.state.character.charisma}</div>
      <button className="btn btn-default" type="button" onClick={this._onRollStatDice}>Roll Stat Dice</button>
    </div>`

  _onRollStatDice: ->
    CharacterGeneratorThreeFiveActions.rollStatDice()

  _onCharacterUpdated: ->
    @setState getCharacterGeneratorState()

window.CharacterGeneratorThreeFive = CharacterGeneratorThreeFive
