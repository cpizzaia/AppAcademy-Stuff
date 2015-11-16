var Filter = React.createClass({
  getInitialState: function(){
    return ({seating: 0});

  },

  increment: function(e){
    e.preventDefault();
    this.setState({seating: this.state.seating + 1});
  },

  decrement: function(e){
    e.preventDefault();
    this.setState( {seating: this.state.seating - 1});
  },

  handleSubmit: function(){
    FilterParamsStore.addFilter(this.state);
  },

  render: function(){
    return(
      <form onSubmit={this.handleSubmit}>
        <p>{this.state.seating}</p>
        <label> Seats
          <button onClick={this.increment}>+</button>
          <button onClick={this.decrement}>-</button>
        </label>
        <button>Apply Params</button>
      </form>
    );
  }
});
