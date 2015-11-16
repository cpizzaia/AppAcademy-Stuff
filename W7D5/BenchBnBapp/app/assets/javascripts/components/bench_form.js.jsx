var BenchForm = React.createClass({

  mixins: [React.addons.LinkedStateMixin, ReactRouter.History],

  getInitialState: function(){
    var lng = this.props.location.query.lng;
    var lat = this.props.location.query.lat;
    return ({lat: lat, lng: lng, description: "", seating: 0});
  },

  clickHandle: function(e){
    e.preventDefault();
    ApiUtil.createBench(this.state);
    this.history.pushState(null, "/");
  },

  increment: function(e){
    e.preventDefault();
    this.setState({seating: this.state.seating + 1});
  },

  decrement: function(e){
    e.preventDefault();
    this.setState({seating: this.state.seating - 1});
  },



  render: function(){
    return(
      <form>
        <label> Latitiude
          <input type="text" valueLink={this.linkState("lat")}/>
        </label>

        <label> Longitude
          <input type="text" valueLink={this.linkState("lng")}/>
        </label>

        <label> Seating
          <p>{this.state.seating}</p>
          <button onClick={this.increment}>+</button>
          <button onClick={this.decrement}>-</button>
        </label>

        <label> Description
          <input type="text" valueLink={this.linkState("description")}/>
        </label>
        <button onClick={this.clickHandle}> Create Bench </button>
      </form>
    );
  }
});
