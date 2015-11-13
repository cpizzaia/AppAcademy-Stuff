var Map = React.createClass({
  getInitialState: function(){
    return {benches: {}, allMarkers: []};
  },

  componentDidMount: function(){
    var map = React.findDOMNode(this.refs.map);
    var mapOptions = {
      center: {lat: 40.77, lng: -73.97},
      zoom: 13
    };
    this.map = new google.maps.Map(map, mapOptions);



    this.map.addListener('idle', function() {
      var bounds = this.map.getBounds();
      var northEast = bounds.getNorthEast();
      var southWest = bounds.getSouthWest();
      bounds = {
        "northEast": {"lat": northEast.lat(), "lng": northEast.lng()},
        "southWest": {"lat": southWest.lat(), "lng": southWest.lng()}
      };
      BenchStore.fetch(bounds);
    }.bind(this));
    BenchStore.addChangeListener(this._changed);
  },

  _changed: function(){
    var markers = [];
    var benches = BenchStore.all();
    for (var i = 0; i < benches.length; i++){
      var myLatLng = {lat: benches[i].lat, lng: benches[i].lng};
      var marker = new google.maps.Marker({
        position: myLatLng,
        map: this.map,
        title: benches[i].description
      });
      markers.push(marker);
    }
    this._changeMarkers(markers);
    this.setState({benches: benches, allMarkers: markers});
  },

  _changeMarkers: function(markers){
    for (var i = 0; i < markers.length; i++){
      if (!(this._included(this.state.allMarkers, markers[i]))){
        markers[i].setMap(this.map);
      }
    }
    for (var j = 0; j < this.state.allMarkers.length; j++){
      if (!(this._included(markers, this.state.allMarkers[j]))){
        this.state.allMarkers[j].setMap(null);
      }
    }
  },


  _included: function(markers_array, marker){
    for (var i = 0; i < markers_array; i++){
      if (markers_array[i].position.lat() === marker.position.lat() && markers_array[i].position.lng() === marker.position.lng()){
        return true;
      }
    }
    return false;
  },

  render: function(){
    return <div className="map" ref="map">{this.state.map}</div>;
  }
});
