var AutoComplete = React.createClass({
  getInitialState: function(){
    return {query: ""};
  },

  handleChange: function(e) {
    this.setState({query: e.target.value});
  },

  // getDefaultProps: function(){
  //   return {names: ["Justin", "Cody", "Sennacy", "Madison", "Jonathan", "Connie"]};
  // },
  handleClick: function(e) {
    // debugger
    this.setState({query: e.target.innerHTML});
  },

  render: function(){
    var names;
    if (this.state.query === "") {
      names = [];
    } else {
      names = this.props.names.filter(function (name) {
        return name.toLowerCase().match(this.state.query.toLowerCase());
      }.bind(this));
    }

    return (
      <div>
        <input type="text" value={ this.state.query } onChange={this.handleChange} />
        <ul>
          {names.map(function(name) {
            return <li onClick={this.handleClick} key={name}>{name}</li>;
          }.bind(this))
        }
        </ul>
      </div>
    );
  }
});
