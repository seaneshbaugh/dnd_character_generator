getCharacterGeneratorCharacterStatsState = ->
  allowManualEntry: CharacterGeneratorThreeFiveStatsSelectorStore.getAllowManualEntry()
  diceMode: CharacterGeneratorThreeFiveStatsSelectorStore.getDiceMode()
  statSelectors: CharacterGeneratorThreeFiveStatsSelectorStore.getStatSelectors()

CharacterGeneratorThreeFiveCharacterStats = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  getInitialState: ->
    getCharacterGeneratorCharacterStatsState()

  componentDidMount: ->
    CharacterGeneratorThreeFiveStatsSelectorStore.addStatSelectorChangedListener @_onStatSelectorChanged

    CharacterGeneratorThreeFiveStatsSelectorStore.addDiceModeChangedListener @_onDiceModeChanged

  componentWillUnmount: ->
    CharacterGeneratorThreeFiveStatsSelectorStore.addDiceModeChangedListener @_onDiceModeChanged

    CharacterGeneratorThreeFiveStatsSelectorStore.removeDiceModeChangedListener @_onDiceModeChanged

  render: ->
    if @state.diceMode == "point-buy"
      manualEntryStatus = `<CharacterGeneratorThreeFivePointBuyStatus character={this.props.character} />`
    else if @state.diceMode == "simple-entry"
      manualEntryStatus = `<CharacterGeneratorThreeFiveSimpleEntryStatus character={this.props.character} />`

    `<div className="col-xs-12 col-sm-9 character-stats">
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="0" statName={this.state.statSelectors["0"]} statValue={this.props.character[this.state.statSelectors["0"]]} />
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="1" statName={this.state.statSelectors["1"]} statValue={this.props.character[this.state.statSelectors["1"]]} />
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="2" statName={this.state.statSelectors["2"]} statValue={this.props.character[this.state.statSelectors["2"]]} />
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="3" statName={this.state.statSelectors["3"]} statValue={this.props.character[this.state.statSelectors["3"]]} />
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="4" statName={this.state.statSelectors["4"]} statValue={this.props.character[this.state.statSelectors["4"]]} />
      <CharacterGeneratorThreeFiveCharacterStat allowManualEntry={this.state.allowManualEntry} statIndex="5" statName={this.state.statSelectors["5"]} statValue={this.props.character[this.state.statSelectors["5"]]} />
      <select value={this.state.diceMode} onChange={this._onChangeDiceMode}>
        <option value="standard">Standard</option>
        <option value="5d6k3">5d6k3</option>
        <option value="elite-array">Elite Array</option>
        <option value="point-buy">Point Buy</option>
        <option value="non-elite-array">Non-Elite Array</option>
        <option value="original-3d6">Original 3d6</option>
        <option value="simple-entry">Simple Entry</option>
        <option value="low-power-campaign">Low Power Campaign</option>
        <option value="easy-campaign">Easy Campaign</option>
        <option value="standard-campaign">Standard Campaign</option>
        <option value="tougher-campaign">Tougher Campaign</option>
        <option value="high-power-campaign">High Power Campaign</option>
      </select>
      <button className="btn btn-default" disabled={this.state.allowManualEntry} type="button" onClick={this._onRollStatDice}>Roll Stat Dice</button>
      {manualEntryStatus}
    </div>`

  _onChangeDiceMode: ->
    CharacterGeneratorThreeFiveStatSelectorActions.setDiceMode(event.target.value)

  _onRollStatDice: ->
    CharacterGeneratorThreeFiveActions.rollStatDice()

  _onDiceModeChanged: ->
    @setState getCharacterGeneratorCharacterStatsState()

  _onStatSelectorChanged: ->
    @setState getCharacterGeneratorCharacterStatsState()

window.CharacterGeneratorThreeFiveCharacterStats = CharacterGeneratorThreeFiveCharacterStats
