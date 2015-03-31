getCharacterGeneratorCharacterStatsState = ->
  statSelectors: CharacterGeneratorThreeFiveStatsSelectorStore.getStatSelectors()

CharacterGeneratorThreeFiveCharacterStats = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  getInitialState: ->
    getCharacterGeneratorCharacterStatsState()

  componentDidMount: ->
    CharacterGeneratorThreeFiveStatsSelectorStore.addStatSelectorChangedListener @_onStatSelectorChanged

  componentWillUnmount: ->
    CharacterGeneratorThreeFiveStatsSelectorStore.removeStatSelectorChangedListener @_onStatSelectorChanged

  render: ->
    `<div className="col-xs-12 col-sm-9 character-stats">
      <CharacterGeneratorThreeFiveCharacterStat statIndex="0" statName={this.state.statSelectors["0"]} statValue={this.props.character[this.state.statSelectors["0"]]} />
      <CharacterGeneratorThreeFiveCharacterStat statIndex="1" statName={this.state.statSelectors["1"]} statValue={this.props.character[this.state.statSelectors["1"]]} />
      <CharacterGeneratorThreeFiveCharacterStat statIndex="2" statName={this.state.statSelectors["2"]} statValue={this.props.character[this.state.statSelectors["2"]]} />
      <CharacterGeneratorThreeFiveCharacterStat statIndex="3" statName={this.state.statSelectors["3"]} statValue={this.props.character[this.state.statSelectors["3"]]} />
      <CharacterGeneratorThreeFiveCharacterStat statIndex="4" statName={this.state.statSelectors["4"]} statValue={this.props.character[this.state.statSelectors["4"]]} />
      <CharacterGeneratorThreeFiveCharacterStat statIndex="5" statName={this.state.statSelectors["5"]} statValue={this.props.character[this.state.statSelectors["5"]]} />
    </div>`

  _onStatSelectorChanged: ->
    @setState getCharacterGeneratorCharacterStatsState()

window.CharacterGeneratorThreeFiveCharacterStats = CharacterGeneratorThreeFiveCharacterStats
