var ToyIndexItem = React.createClass ({

  mixins: [ReactRouter.History],

  handleClick: function (e) {
    e.preventDefault();
    this.history.pushState(null, '/pokemon/' + this.props.pokemonid + '/toys/' + this.props.toy.id);
  },

  render: function () {

    return (
      <li key={this.props.toy.id} onClick={this.handleClick} className="toy-list-item">
        name: {this.props.toy.name}
      </li>
    );
  }
});
