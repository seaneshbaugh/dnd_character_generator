var React = require("react");

class HelloWorld extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.unsubscribe = this.props.store.subscribe(() => {
      this.forceUpdate();
    });
  }

  componentWillUnmount() {
    this.unsubscribe();
  }

  render() {
    const name = this.props.store.getState().name;

    const updateName = (event) => {
      this.props.store.dispatch({"type": GREETING_UPDATE_NAME, "newName": event.target.value});
    };

    return (
        <div className="hello-world">
        <h1>Hello, {name}!</h1>
        <input type="text" value={name} onChange={updateName} />
      </div>
    );
  }
}

module.exports = HelloWorld;
