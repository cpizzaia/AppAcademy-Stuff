function Board(){
  this.grid = [[-1, -1, -1],[-1,-1,-1],[-1,-1,-1]];
};

Board.prototype.print = function(){
  this.grid.forEach(function(cV,idx,arr){
    var printArray = [];
    cV.forEach(function(s,i,ar) {
      if (s===-1){
        printArray.push(" ");
      } else if (s === 0) {
        printArray.push("O");
      } else {
        printArray.push("X");
      }
    });
    console.log(printArray);
  });
};

Board.prototype.won = function () {
  return (this.row || this.column || this.diag)
};

Board.prototype.diag = function (idx) {
  temp = this.grid[0][0]


};

Board.prototype.row = function (idx) {};

module.exports = Board;
