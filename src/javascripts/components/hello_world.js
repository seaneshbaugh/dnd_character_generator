var React = require("react");

class HelloWorld extends React.Component {
  constructor(props) {
    super(props);

    console.log(props);
  }

  render() {
    return (
      <div className="hello-world">Hello, world!</div>
    );
  }
}

module.exports = HelloWorld;
