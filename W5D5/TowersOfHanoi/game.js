var readline = require('readline');

function HanoiGame(numDisks){
  this.numDisks = numDisks;
  this.towers = [[], [], []];
  for (i = 1; i <= numDisks; i++){
    this.towers[0].push(i)
  };

  this.reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
};

HanoiGame.prototype.move = function(towerStart, towerEnd){
  if (this.isValidMove(towerStart, towerEnd)){
    var disk = this.towers[towerStart].shift();
    this.towers[towerEnd].unshift(disk);
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.isWon = function(){
  return (this.towers[1].length === this.numDisks || this.towers[2].length === this.numDisks);
};

HanoiGame.prototype.isValidMove = function(startTower, endTower){
  var moveDisk = this.towers[startTower][0];
  var endDisk = this.towers[endTower][0];

  return (moveDisk < endDisk || !endDisk);

};

HanoiGame.prototype.print = function () {
  console.log(JSON.stringify(this.towers));
};

HanoiGame.prototype.promptMove = function (callback) {
  var context = this;
  this.print();
  context.reader.question("Pick a stack to move from; 1, 2, or 3?", function (numString1) {
    context.reader.question("Pick a tower to place the piece.", function (numString2) {
      var startTower = parseInt(numString1) - 1;
      var endTower = parseInt(numString2) - 1;

      callback(startTower, endTower);
    });
  });
};

HanoiGame.prototype.run = function (completionCallback) {
  // var someCondition  = something to do with this.promptMove(this.move)
  this.promptMove( function (startTowerIdx, endTowerIdx) {
    if(this.move(startTowerIdx, endTowerIdx)) {
      if (this.isWon()){
        console.log("game won!");
        completionCallback();
      }
      else{
        this.run(completionCallback);
      }
    }
    else{
      console.log("invalid move");
      this.run(completionCallback);
    }
  }.bind(this));
}


var a = new HanoiGame(4);
a.run(a.reader.close.bind(a.reader));
