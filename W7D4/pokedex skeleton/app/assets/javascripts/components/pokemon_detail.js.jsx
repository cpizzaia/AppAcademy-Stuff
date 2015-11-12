var PokemonDetail = React.createClass({

  mixin: [ReactRouter.History],

  getInitialState: function(){
    return this.getStateFromStore();
  },

  getStateFromStore: function(){
    return {pokemon: PokemonStore.pokemon()};
  },

  componentDidMount: function(){
    var id = parseInt(this.props.params.pokemonid);
    PokemonStore.addPokemonDetailChangeListener(this._changed);
    ApiUtil.fetchPokemon(id);
  },

  componentWillReceiveProps: function (nextProps) {
    var id = parseInt(nextProps.params.pokemonid);
    ApiUtil.fetchPokemon(id);
  },

  _changed: function () {
    this.setState({pokemon: PokemonStore.pokemon()});
  },

  render: function() {
    var htmlImg,
    htmlToysIndex, htmlDescription;
    if (this.state.pokemon){

      htmlImg = <img src={this.state.pokemon.image_url}/>;
      htmlDescription = <h1>Name:{this.state.pokemon.name}</h1>;
      htmlToysIndex = <ToysIndex pokemon={this.state.pokemon} />;
    }
    return(
      <div className="detail">
        {htmlImg}
        {htmlDescription}
        {htmlToysIndex}
      </div>
    );
  }

});
