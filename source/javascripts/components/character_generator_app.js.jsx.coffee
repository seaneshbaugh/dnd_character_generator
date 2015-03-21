getCharacterGeneratorAppState = ->
  generator: CharacterGeneratorAppStore.getGenerator()

CharacterGeneratorApp = React.createClass
  getInitialState: ->
    getCharacterGeneratorAppState()

  componentDidMount: ->
    CharacterGeneratorAppStore.addSelectGeneratorListener @_onSelectGenerator

  componentWillUnmount: ->
    CharacterGeneratorAppStore.removeSelectGeneratorListener @_onSelectGenerator

  render: ->
    if @state.generator
      `<div>
        {this.state.generator}
      </div>`
    else
      `<div className="btn-group btn-group-justified" role="group">
        <GeneratorSelectButton version="3.5" />
        <GeneratorSelectButton version="4" />
        <GeneratorSelectButton version="Next" />
      </div>`

  _onSelectGenerator: ->
    @setState getCharacterGeneratorAppState()

window.CharacterGeneratorApp = CharacterGeneratorApp
