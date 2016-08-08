const React = require("react");

class CharacterGenerator extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.unsubscribe = this.props.store.subscribe(() => this.forceUpdate());
  }

  componentWillUnmount() {
    this.unsubscribe();
  }

  getChildContext() {
    return {
      "store": this.props.store
    };
  }

  render() {
    return (
        <div className="character-generator">
        <h1>DnD Character Generator</h1>
        </div>
    );
  }
}

CharacterGenerator.childContextTypes = {
  "store": React.PropTypes.object
};

module.exports = CharacterGenerator;
