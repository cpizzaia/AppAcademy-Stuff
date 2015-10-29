"use strict";

function range(start, end){
  var result = [start];

  if (start === end) { return result; }

  return result.concat(range(start + 1, end));
}

function exponent(base, exp){
    if (exp === 0)
    {
      return 1;
    }
    else {
      return (base * exponent(base, exp - 1));
    }
};

function fibRec(n){

  if (n === 0) {
    return [];
  }
  else if (n === 1) {
    return [1];
  }
  else if (n === 2) {
    return [1,1];
  }

  var result = fibRec(n-1);
  return result.concat(result[result.length-1] + result[result.length-2]);


};

function bsearch(array, target){
  var midpoint = Math.floor(array.length/2);

  if (array.length === 0) {
    return null;
  }
  else if (target === array[midpoint]){
    return midpoint;
  }
  else if (target > array[midpoint]){
    var val = bsearch(array.slice(midpoint, array.length), target);
    if ( val === null ) {
      return null;
    }
    else {
      return (midpoint + val);
    }
  }
  else {
    return bsearch(array.slice(0, midpoint), target);
  }

};

function makeChange(value, coins){

  var bestChange = null;
  var previousBestChange = null;
  var currentBestChange = null;
  for (var i = 0; i < coins.length; i++){

    temp = value - coins[i];

    if (temp === 0){

      return [coins[i]];
    }

    else if (temp > 0){

      previousBestChange = [coins[i]].concat(makeChange(temp, coins));

    }
    if (bestChange === null){
      bestChange = previousBestChange;
    }
    else if (bestChange.length > previousBestChange.length){
      bestChange = previousBestChange;
    }


  }
  return bestChange;


};


function mergeSort(array){
  if (array.length === 1){
    return array;
  }

  var midpoint = Math.floor(array.length / 2);
  var left = array.slice(0, midpoint);
  var right = array.slice(midpoint, array.length);
  return (merge(mergeSort(left), mergeSort(right)));

}

function merge(left, right){
  var result = [];

  while (left.length > 0 && right.length > 0){
    if (left[0] > right[0]){
      result.push(right.shift());
    } else {
      result.push(left.shift());
    }
  }

  return result.concat(left).concat(right);
}

function subsets(array){
  if (array.length === 0){
    return [array];
  }

  var result;

  var value = array.shift();

  result = subsets(array);

  for (i = 0; i < array.length; i++){
    result.push(result[i].concat([value]));

  }
  return result;


};

// push(array.concat([value])));
