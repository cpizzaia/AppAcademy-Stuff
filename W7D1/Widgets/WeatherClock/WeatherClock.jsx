var Clock = React.createClass({
  getInitialState: function(){
    return {time: new Date()};
  },

  componentDidMount: function(){
    this.interval = setInterval(function(){
      var d = this.state.time;
      d.setMilliseconds(d.getMilliseconds() + 1000);

      this.setState({time: d});
    }.bind(this), 1000);
  },

  componentWillUnmount: function() {
    clearInterval(this.interval);
  },

  render: function() {
    return (
      <div>{this.state.time.toString()}</div>
    );
  }
});

var Weather = React.createClass({
  getInitialState: function () {
    return {
      city: "",
      weather: "",
      temperature: ""
    }
  },

  componentDidMount: function(){
    navigator.geolocation.getCurrentPosition(function(location){
      this.weatherRequest(location); // might have to process location
    }.bind(this));
  },

  weatherRequest: function(location){
    var request = new XMLHttpRequest();
    var url = "http://api.openweathermap.org/data/2.5/weather?lat=";
    url += location.coords.latitude + "&lon=";
    url += location.coords.longitude + "&appid=" + "f19546100e8188e988f0c5f40b82aba5";
    request.open('GET', url, true);

    request.onload = function() {
      if (request.status >= 200 && request.status < 400) {
        var resp = JSON.parse(request.responseText);
        this.setState({
          city: resp.name,
          weather: resp.weather[0].description,
          temperature: Math.round(resp.main.temp * 9/5 - 459.67)
        });
      } else {
        console.log(request.status);
      }
    }.bind(this);

    request.onerror = function(){
      console.log("failed");
    };

    request.send();
  },
  render: function () {
    return (
      <div>
        <h1>{this.state.city}</h1>
        <p>Current Weather: {this.state.weather}</p>
        <p>Current Temperature: {this.state.temperature} F</p>
      </div>
    );
  }
});
