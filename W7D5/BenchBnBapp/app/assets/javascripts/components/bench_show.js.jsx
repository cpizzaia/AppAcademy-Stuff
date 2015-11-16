var BenchShow = React.createClass({
  getInitialState: function(){
    return {bench: BenchStore.findById(parseInt(this.props.params.benchid))};
  },

  render: function(){
    return(
      <div>
        <h2>Description: {this.state.bench.description}</h2>
        <h3>Seats: {this.state.bench.seating}</h3>
        <h3>Latitiude: {this.state.bench.lat} Longitude:{this.state.bench.lng}</h3>
      </div>
    );
  }
});
