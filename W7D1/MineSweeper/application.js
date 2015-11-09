var MinesweeperGame = React.createClass({
  getInitialState: function() {
    return {
      activeBoard: new window.Minesweeper.Board(8, 10),
      gameOver: false,
      gameWon: false
    };
  },

  updateGame: function(tile, flagging) {
    if (this.state.gameOver){
      return;
    }
    if (flagging) {
      tile.flagged = true;
    } else {
      tile.explore();
    }

    this.setState({
      gameOver: (this.state.activeBoard.lost() || this.state.activeBoard.won()),
      gameWon: this.state.activeBoard.won()
    });
  },

  restartGame: function(){
    this.setState({
      activeBoard: new window.Minesweeper.Board(8, 10),
      gameOver: false,
      gameWon: false
    });
  },

  render: function() {
    var message = "";
    if (this.state.gameWon) {
      message = "you won";
    } else if (this.state.gameOver) {
      message = "you lost";
    }
    return (
      <div className="container">
        <Board board={this.state.activeBoard} updateGame={this.updateGame} />
        <Modal board={this.state.activeBoard} restartGame={this.restartGame} />
      </div>
    );
  }
});

var Modal = React.createClass({
  render: function(){
    var klass, message;

    if (this.props.board.won()) {
      klass = "modal visible";
      message = "You Win!";
    } else if (this.props.board.lost()){
      klass = "modal visible";
      message = "You Lose!";
    } else {
      klass = "modal";
      message = "";
    }

    return (
      <section className={klass}>
        <article className="modal-content">
          <h1>{message}</h1>
          <button onClick={this.props.restartGame}>Restart</button>
        </article>
      </section>
    );
  }

});


var Board = React.createClass({

  render: function(){
    var grid = this.props.board.grid.map(function(row, rowIdx) {
      var tiles = row.map(function(tile){
        return (
          <Tile tile={tile} key={tile.pos} updateGame={this.props.updateGame} />
        );
      }.bind(this));

      return (
        <div className="row group" key={rowIdx}>{tiles}</div>
      );

    }.bind(this));

    return (
      <div className="board">
        {grid}
      </div>
    );
  }

});


var Tile = React.createClass({

  handleClick: function(e){
    this.props.updateGame(this.props.tile, e.altKey);
  },

  render: function(){
    var tileState;
    var currentTile = this.props.tile;
    if (currentTile.flagged) {
      tileState = "⚑";
    } else if (currentTile.explored) {
      if (currentTile.bombed) {
        tileState = "💣";
      } else {
        tileState = (currentTile.adjacentBombCount() === 0 ? " " : currentTile.adjacentBombCount());
      }
    } else {
      tileState = "T";
    }

    return <span className="tile" onClick={this.handleClick}>{tileState}</span>;
  }
});
