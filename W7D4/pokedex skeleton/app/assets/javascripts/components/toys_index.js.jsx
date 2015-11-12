var ToysIndex = React.createClass({

  render: function(){
    return(
      <div>
        <ul>
          {this.props.pokemon.toys.map(function(toy){
            return (
              <ToyIndexItem pokemonid={this.props.pokemon.id} toy={toy}/>
            );
          }.bind(this))}
        </ul>
        {this.props.children}
      </div>
    );
  }

});
