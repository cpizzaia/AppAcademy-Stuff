var BenchesIndexItem = React.createClass({

  mixins: [ReactRouter.History],

  getInitialState: function(){
    return {class: "black"};
  },

  handleClick: function(){
    this.history.pushState(null, "/benches/" + this.props.bench.id);
  },

  render: function(){
    return <h1 onClick={this.handleClick} className={this.state.class}>{this.props.bench.description} Seats: {this.props.bench.seating}</h1>;
  }

});
