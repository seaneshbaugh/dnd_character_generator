CharacterGeneratorThreeFiveCharacterStat = React.createClass
  propTypes:
    statIndex: React.PropTypes.string.isRequired
    statName: React.PropTypes.string.isRequired
    # statValue: React.PropTypes.number.isRequired

  render: ->
    if !@props.allowManualEntry or (@props.statValue and @props.statValue >=3 and @props.statValue <= 18)
      formGroupClass = "form-group"
    else
      formGroupClass ="form-group has-error"

    `<div className="form-inline">
      <div className={formGroupClass}>
        <label className="sr-only" htmlFor={this.props.statName + "_value"}>{this.props.statName}</label>
        <input className="form-control" disabled={!this.props.allowManualEntry} id={this.props.statName + "_value"} type="text" value={this.props.statValue} onChange={this._onChangeStatValue}/>
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
