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
      <div className="row">
        <CharacterGeneratorThreeFiveCharacterStats character={this.state.character} />
        <div className="col-xs-12 col-sm-3">
          <div>
            <strong>Strength:</strong> {this.state.character.strength}
          </div>
          <div>
            <strong>Dexterity:</strong> {this.state.character.dexterity}
          </div>
          <div>
            <strong>Constitution:</strong> {this.state.character.constitution}
          </div>
          <div>
            <strong>Intelligence:</strong> {this.state.character.intelligence}
          </div>
          <div>
            <strong>Wisdom:</strong> {this.state.character.wisdom}
          </div>
          <div>
            <strong>Charisma:</strong> {this.state.character.charisma}
          </div>
        </div>
      </div>
      <button className="btn btn-default" type="button" onClick={this._onRollStatDice}>Roll Stat Dice</button>
    </div>`

  _onRollStatDice: ->
    CharacterGeneratorThreeFiveActions.rollStatDice()

  _onCharacterUpdated: ->
    @setState getCharacterGeneratorState()

window.CharacterGeneratorThreeFive = CharacterGeneratorThreeFive
