CharacterGeneratorThreeFiveCharacterStat = React.createClass
  propTypes:
    statIndex: React.PropTypes.string.isRequired
    statName: React.PropTypes.string.isRequired
    statValue: React.PropTypes.number.isRequired

  render: ->
    `<div className="form-inline">
      <div className="form-group">
        <label className="sr-only" htmlFor={this.props.statName + "_value"}>{this.props.statName}</label>
        <input type="text" className="form-control" id={this.props.statName + "_value"} value={this.props.statValue} onChange={this._onChangeStatValue}/>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "strength"} name={"stat_" + this.props.statName} type="radio" value="strength" onChange={this._onChangeStatSelectors} /> Strength
        </label>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "dexterity"} name={"stat_" + this.props.statName} type="radio" value="dexterity" onChange={this._onChangeStatSelectors} /> Dexterity
        </label>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "constitution"} name={"stat_" + this.props.statName} type="radio" value="constitution" onChange={this._onChangeStatSelectors} /> Constitution
        </label>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "intelligence"} name={"stat_" + this.props.statName} type="radio" value="intelligence" onChange={this._onChangeStatSelectors} /> Intelligence
        </label>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "wisdom"} name={"stat_" + this.props.statName} type="radio" value="wisdom" onChange={this._onChangeStatSelectors} /> Wisdom
        </label>
      </div>
      <div className="radio">
        <label>
          <input checked={this.props.statName === "charisma"} name={"stat_" + this.props.statName} type="radio" value="charisma" onChange={this._onChangeStatSelectors} /> Charisma
        </label>
      </div>
    </div>`

  _onChangeStatValue: (event) ->
    CharacterGeneratorThreeFiveActions.setStat(this.props.statName, event.target.value)

  _onChangeStatSelectors: (event) ->
    CharacterGeneratorThreeFiveStatSelectorActions.setStatSelectors(this.props.statIndex, event.target.value)

window.CharacterGeneratorThreeFiveCharacterStat = CharacterGeneratorThreeFiveCharacterStat
