var ApiUtil = window.ApiUtil = function () {

};

ApiUtil.fetchAllPokemon = function () {
  $.ajax({
    url: 'api/pokemon',
    type: 'GET',
    success: function (data) {
      ApiActions.receiveAllPokemons(data);
    }
  });

};

ApiUtil.fetchPokemon = function (id) {
  $.ajax({
    url: 'api/pokemon/' + id,
    type: 'GET',
    success: function (data) {
      ApiActions.receivePokemon(data);
    }
  });
};

ApiUtil.createPokemon = function(pokemonObj) {
  $.ajax({
    url: 'api/pokemon/',
    type: 'POST',
    dataType: 'json',
    contentType: 'application/json',
    data: JSON.stringify(pokemonObj),
    success: function (data) {
      ApiActions.receiveAllPokemons(data);
    }
  });
};
