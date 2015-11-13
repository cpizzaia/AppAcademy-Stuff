var BenchesIndex = React.createClass({

  getInitialState: function(){
    return {benches: BenchStore.all()};
  },

  componentDidMount: function(){
    BenchStore.addChangeListener(this._changed);
  },

  _changed: function(){
    this.setState({benches: BenchStore.all()});
  },




  render: function(){

    return (
      <div>
        {this.state.benches.map(function(bench){
          return <BenchesIndexItem bench={bench} />;
        }.bind(this))}
      </div>
    );
  }

});
