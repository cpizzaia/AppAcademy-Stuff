var BenchesIndex = React.createClass({

  mixins: [ReactRouter.History],

  getInitialState: function(){
    return {benches: BenchStore.all()};
  },

  componentDidMount: function(){
    BenchStore.addChangeListener(this._changed);
  },

  componentWillUnmount: function(){
    BenchStore.removeChangeListener(this._changed);
  },

  clickHandler: function(e){
    e.preventDefault();
    this.history.pushState(null, '/benches/new');
  },

  _changed: function(){
    this.setState({benches: BenchStore.all()});
  },

  render: function(){

    return (
      <div>
        {this.state.benches.map(function(bench){
          return <BenchesIndexItem key={bench.id} bench={bench} />;
        }.bind(this))}
      </div>
    );
  }

});
