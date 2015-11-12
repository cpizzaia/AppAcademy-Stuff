var PokemonIndexItem = React.createClass({

  mixins: [ReactRouter.History],

  handleClick: function (e) {
    e.preventDefault();
    this.history.pushState(null, '/pokemon/' + this.props.pokemon.id);
  },

  render: function(){
    return(
        <li onClick={this.handleClick} className='poke-list-item'>{this.props.pokemon.name} - {this.props.pokemon.poke_type}</li>
    );
  }

});
