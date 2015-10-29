"use strict";

Array.prototype.uniq = function(){
  var result = [];
  for(var i = 0; i <= this.length-1; i++){
    if (!result.includes(this[i])){
      result.push(this[i]);
    }
  };
  return result;
};

Array.prototype.includes = function(el){
  for(var i = 0; i <= this.length-1; i++){
    if (this[i] === el){
      return true;
    }
  };
  return false;
};

Array.prototype.twoSum = function(){
  var result = [];
  for(var i = 0; i <= this.length-2; i++){
    for(var j = i+1; j <= this.length-1; j++){
      if(this[i] + this[j] === 0){
        result.push([i, j]);
      }
    };
  };
  return result;
}

Array.prototype.transpose = function(){
  var cols = this[0].length;

  var newArr = [];
  for(var i = 1; i <= cols; i++){
    newArr.push([]);
  };

  for(var i = 0; i <= this[0].length-1; i++){
    for(var j = 0; j <= this.length-1; j++){
      newArr[i].push(this[j][i]);
    }
  }
  return newArr;
}
