
var PokemonForm = React.createClass({

  mixins: [React.addons.LinkedStateMixin],

  getInitialState: function () {
    return {name: "", poke_type: "", attack: 1, defense: 1, moves: ["idk"],  image_url: "http://www.appacademy.io/assets/site/staff/tommy-b51defdc24018dd9c1639f3413fde4a9.jpeg"};
  },

  clickHandle: function(e){
    ApiUtil.createPokemon(this.state);
  },

  render: function(){
    return(
      <form onSubmit={this.clickHandle} className="new-pokemon">
        <div>
          <label> Name:
            <input valueLink={this.linkState("name")}/>
          </label>
          <select className="flavor" valueLink={this.linkState("poke_type")} >
            <option value="water" selected="selected">water</option>
            <option value="electric" >electric</option>
            <option value="fire" >fire</option>
            <option value="fighting" >fighting</option>
            <option value="steel" >steel</option>
            <option value="dark" >dark</option>
            <option value="dragon" >dragon</option>
            <option value="ice" >ice</option>
            <option value="ghost" >ghost</option>
            <option value="ground" >ground</option>
            <option value="rock" >rock</option>
            <option value="flying" >flying</option>
            <option value="normal" >normal</option>
            <option value="fairy" >fairy</option>
            <option value="bug" >bug</option>
            <option value="poison" >poison</option>
            <option value="psychic" >psychic</option>
          </select>
          <button value="submit"> Catch Pokemon </button>
        </div>
      </form>
    );
  }

});
