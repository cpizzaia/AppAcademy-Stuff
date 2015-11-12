var ToyDetail = React.createClass({

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

  _findToy: function () {
    if (!this.state.pokemon) {return "text";}
    var id = parseInt(this.props.params.toyid);
    for (var i = 0; i < this.state.pokemon.toys.length; i++) {
      if (this.state.pokemon.toys[i].id === id) {
        return this.state.pokemon.toys[i];
      }
    }
  },

  render: function () {
    var toy = this._findToy();
    var htmlString;
    if (toy) {
      htmlString = <div className="toy-detail"> <img src={toy.image_url} /> Name: {toy.name} Happiness: {toy.happiness} Price: {toy.price}</div>;
    }
    return (
      <div className="detail">
        {htmlString}
      </div>
    );
  }
});
