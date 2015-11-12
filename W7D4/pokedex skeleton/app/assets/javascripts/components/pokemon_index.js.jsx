var PokemonsIndex = React.createClass({
  getInitialState: function () {
    return ({ pokemons: [] });
  },

  componentDidMount: function () {
    PokemonStore.addPokemonsIndexChangeListener(this._change);
    PokemonStore.fetch();
  },

  componentWillUnmount: function (){
    PokemonStore.removePokemonsIndexChangeListener(this._change);
  },

  _change: function () {
    this.setState({ pokemons: PokemonStore.all() });
  },

  render: function () {

    return (
      <div>
        <PokemonForm />
        <div className="pokemon-index">
          <ul>
            {this.state.pokemons.map(function(pokemon){
                return <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />;
            })}
          </ul>
        </div>
          {this.props.children}
      </div>
    );
  }
});
