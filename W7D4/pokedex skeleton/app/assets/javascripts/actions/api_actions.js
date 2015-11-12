var ApiActions = window.ApiActions = function () {

};

ApiActions.receiveAllPokemons = function (data) {
  AppDispatcher.dispatch({
    actionType: PokemonConstants.POKEMONS_RECIEVED,
    pokemons: data
  });
};

ApiActions.receivePokemon = function (data) {
  AppDispatcher.dispatch({
    actionType: PokemonConstants.POKEMON_RECIEVED,
    pokemon: data
  });
};
