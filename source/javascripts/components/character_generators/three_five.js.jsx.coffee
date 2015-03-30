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
      <CharacterGeneratorThreeFiveCharacterStats character={this.state.character} />
      <button className="btn btn-default" type="button" onClick={this._onRollStatDice}>Roll Stat Dice</button>
    </div>`

  _onRollStatDice: ->
    CharacterGeneratorThreeFiveActions.rollStatDice()

  _onCharacterUpdated: ->
    @setState getCharacterGeneratorState()

window.CharacterGeneratorThreeFive = CharacterGeneratorThreeFive
