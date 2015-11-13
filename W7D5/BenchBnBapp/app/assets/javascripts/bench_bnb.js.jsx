(function () {
  $(document).ready(function () {
    var Router = ReactRouter.Router;
    var Route = ReactRouter.Route;

    React.render(
      <Router>
        <Route path="/" components={Search}>
        </Route>
      </Router>,
      document.getElementById('content')
    );
  });
})();
