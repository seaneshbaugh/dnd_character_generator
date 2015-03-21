GeneratorSelectButton = React.createClass
  propTypes:
    version: React.PropTypes.string.isRequired

  render: ->
    `<div className="btn-group" role="group">
      <button className="btn btn-default" type="button" onClick={this._onSelectVersion}>{this.props.version}</button>
    </div>`

  _onSelectVersion: ->
    CharacterGeneratorAppActions.select(@props.version)

window.GeneratorSelectButton = GeneratorSelectButton
