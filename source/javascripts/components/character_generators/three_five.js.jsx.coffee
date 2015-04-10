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
    errorMessages = @state.character.fullErrorMessages().map (error, index) ->
      `<li key={index}>{error}</li>`

    if errorMessages.length
      errorReport = `<ul>
        {errorMessages}
      </ul>`

    `<div>
      <h2>3.5</h2>
      <div className="row">
        <CharacterGeneratorThreeFiveCharacterStats character={this.state.character} />
        <div className="col-xs-12 col-sm-3">
          <div>
            <strong>Strength:</strong> {this.state.character.strength || 0}
          </div>
          <div>
            <strong>Dexterity:</strong> {this.state.character.dexterity || 0}
          </div>
          <div>
            <strong>Constitution:</strong> {this.state.character.constitution || 0}
          </div>
          <div>
            <strong>Intelligence:</strong> {this.state.character.intelligence || 0}
          </div>
          <div>
            <strong>Wisdom:</strong> {this.state.character.wisdom || 0}
          </div>
          <div>
            <strong>Charisma:</strong> {this.state.character.charisma || 0}
          </div>
        </div>
      </div>
      <CharacterGeneratorThreeFiveCharacterRaces character={this.state.character} />
      {errorReport}
    </div>`

  _onCharacterUpdated: ->
    @setState getCharacterGeneratorState()

window.CharacterGeneratorThreeFive = CharacterGeneratorThreeFive
