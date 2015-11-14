var BenchesIndexItem = React.createClass({
  getInitialState: function(){
    return {class: "black"};
  },

  turnRed: function(){
    this.setState({class: "red"});
  },

  turnBlack: function(){
    this.setState({class: "black"});
  },





  render: function(){

    return <h1 className={this.state.class} onMouseEnter={this.turnRed} onMouseLeave={this.turnBlack}>{this.props.bench.description}</h1>;
  }

});
