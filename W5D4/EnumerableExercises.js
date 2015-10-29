"use strict";

Array.prototype.myEach = function(cb) {
  // var result = []
  for (var i = 0; i < this.length; i++ ){
    // result.push(
      cb(this[i])
    // );
  }
  return this;
};

var myFun = function(num) {
  return (num + 1);
};


Array.prototype.myMap = function(cb) {
  var result = [];

  this.myEach(function (el) {
    result.concat(cb(el));
  });
  this.concat(result);
  this.shift(result.length);
  return this;
};

var a = [1,2,3];
var mappedA = a.myMap(function (el) {
  return el * 2;
});





Array.prototype.myInject = function(cb){
  var acc = 0;
  this.myEach(function(el){
    acc += cb(el);
  });

  return acc;

};
