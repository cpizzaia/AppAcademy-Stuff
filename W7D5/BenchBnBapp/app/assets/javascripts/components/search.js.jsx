var Search = React.createClass({

  getInitialState: function(){
    return({filterParams: FilterParamsStore.all()});
  },

  componentDidMount: function(){
    FilterParamsStore.addChangeListener(this._changed);
  },

  componentWillUnmount: function(){
    FilterParamsStore.removeChangeListener(this._changed);
  },

  clickMapHandler: function(coords){
    this.props.history.pushState(null, '/benches/new', {lat: coords.lat(), lng: coords.lng()});
  },

  _changed: function(){
    this.setState({filterParams: FilterParamsStore.all()});
  },

  render: function(){
    return(
      <div> <Map clickMapHandler={this.clickMapHandler} /> <Filter /> <BenchesIndex /></div>
    );
  }
});
