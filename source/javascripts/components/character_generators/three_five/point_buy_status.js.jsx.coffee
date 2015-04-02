CharacterGeneratorThreeFivePointBuyStatus = React.createClass
  propTypes:
    character: React.PropTypes.object.isRequired

  render: ->
    `<div>
      {window.Helpers.PointBuy.pointBuySum(this._stats())} points spent.<br />
      For reference: low-powered = 15-21, more challenging = 22-24, standard = 25-27, tougher = 28-31, high-powered = 32+.
    </div>`

  _stats: ->
    [
      @props.character.strength
      @props.character.dexterity
      @props.character.constitution
      @props.character.intelligence
      @props.character.wisdom
      @props.character.charisma
    ]

window.CharacterGeneratorThreeFivePointBuyStatus = CharacterGeneratorThreeFivePointBuyStatus
