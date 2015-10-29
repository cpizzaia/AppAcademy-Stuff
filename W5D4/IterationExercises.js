"use strict";

function bubbleSort(array){
  var sorted = false;
  var temp;
  while (!sorted){
    sorted = true;
    for (var i = 0; i < array.length - 1; i++){
      if (array[i] > array[i+1]){
        temp = array[i];
        array[i] = array[i+1];
        array[i+1] = temp;
        sorted = false;
      }
    }
  }
  return array;
};



function substring(string){
  var result = [];
  for (var i = 0; i < string.length; i++){
    for (var j = i + 1; j < string.length + 1; j++){
      result.push(string.substring(i,j))
    };
  };
  return result;
};
