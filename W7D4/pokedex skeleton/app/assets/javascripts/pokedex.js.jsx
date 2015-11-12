(function () {
  $(document).ready(function () {
    var Router = ReactRouter.Router;
    var Route = ReactRouter.Route;

    React.render(
      <Router>
        <Route path="/" component={PokemonsIndex}>
          <Route path="/pokemon/:pokemonid" component={PokemonDetail} />
          <Route path="/pokemon/:pokemonid/toys/:toyid" components={{pokemon: PokemonDetail, toy: ToyDetail}} />
        </Route>
      </Router>,
      document.getElementById('pokedex')
    );
  });
})();
