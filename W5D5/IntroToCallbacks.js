function Clock () {
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  var hours = this.currentTime.getHours();
  var minutes = this.currentTime.getMinutes();
  var seconds = this.currentTime.getSeconds();

  console.log(hours + ":" + minutes + ":" + seconds);

  // Format the time in HH:MM:SS
};

Clock.prototype.run = function () {

  this.currentTime = new Date();

  this.printTime();
  var context = this;


  window.setInterval(this._tick.bind(this), Clock.TICK);

  // window.setInterval(function () {
  //   this
  // }, Clock.TICK);


  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
};

// window.setInterval = function (cb, time) {
//   while (true) {
//     cb()
//     wait(time)
//   }
// }

Clock.prototype._tick = function () {
  this.currentTime.setSeconds(this.currentTime.getSeconds() + 5);
  this.printTime();
  // 1. Increment the currentTime.
  // 2. Call printTime.
};

// var clock = new Clock();
// clock.run();

var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var addNumbers = function (sum, numsLeft, completionCallback)  {
  if (numsLeft === 0) {
    completionCallback(sum)
  } else {
    reader.question("Gimme a damn number!", function(num){
      var newNum = parseInt(num);
      sum += newNum;
      console.log("The sum is " + sum + " asshole!");
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  }

};

// addNumbers(0, 3, function (sum) {
//   console.log("Total Sum: " + sum);
// });



var askIfGreaterThan = function(el1, el2, callback){
  reader.question("Is " + el1 + " greater than " + el2, function(user_input){
    if(user_input === "yes"){
      callback(true);
    }
    else {
      callback(false);
    }
  });

};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outBubbleSortLoop){
  if (i < arr.length-1){
    askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan){
      if (isGreaterThan) {
        var temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outBubbleSortLoop);
    });
  }
  else if (i === (arr.length-1)){
    outBubbleSortLoop(madeAnySwaps);
  }
};

function absurdBubbleSort(arr, sortCompletionCallback){
  function outBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps){
      innerBubbleSortLoop(arr, 0, false, outBubbleSortLoop);
    }
    else {
      sortCompletionCallback(arr);
    }
  };
  outBubbleSortLoop(true)
};

// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });
