(function(){

  var _pokemons = [];
  var _pokemon = [];
  var PokemonStore = window.PokemonStore = $.extend({}, EventEmitter.prototype);
  var PI_CHANGE_EVENT = 'pi_change';
  var P_CHANGE_EVENT = 'p_change';

  PokemonStore.addPokemonsIndexChangeListener = function (callback) {
    this.on(PI_CHANGE_EVENT, callback);
  };

  PokemonStore.removePokemonsIndexChangeListener = function (callback) {
    this.removeListener(PI_CHANGE_EVENT, callback);
  };

  PokemonStore.piChanged = function () {
    this.emit(PI_CHANGE_EVENT);
  };

  PokemonStore.addPokemonDetailChangeListener = function (callback) {
    this.on(P_CHANGE_EVENT, callback);
  };

  PokemonStore.removePokemonDetailChangeListener = function (callback) {
    this.removeListener(P_CHANGE_EVENT, callback);
  };

  PokemonStore.pChanged = function () {
    this.emit(P_CHANGE_EVENT);
  };

  PokemonStore.dispatcherId = AppDispatcher.register(function (payload) {
    switch (payload.actionType) {
      case PokemonConstants.POKEMONS_RECIEVED:
        PokemonStore.store(payload.pokemons);
        break;
      case PokemonConstants.POKEMON_RECIEVED:
        PokemonStore.storePokemon(payload.pokemon);
        break;
    }
  });

  PokemonStore.find = function(id){
    for( var i =0; i <_pokemons.length; i++){
      if (_pokemons[i].id === id){
        return _pokemons[i];
      }
    }

  };

  PokemonStore.all = function(){
    return _pokemons.slice();
  };

  PokemonStore.fetch = function(){
    ApiUtil.fetchAllPokemon();
  };

  PokemonStore.store = function (pokemons) {
    _pokemons = pokemons;
    this.piChanged();
  };

  PokemonStore.storePokemon = function(pokemon) {
    _pokemon = [pokemon];
    this.pChanged();
  };

  PokemonStore.pokemon = function(){
    return _pokemon.slice()[0];
  };





})();
