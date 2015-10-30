Function.prototype.myBind = function (context) {
  var fn = this;
  return function () {
    // debugger
    return fn.apply(context);
  };
};


function Cat(name){
  this.name = name;

  this.sayName = function (color) {
    console.log(this.name + " is name");
  };
};


var cat = new Cat("Paprika");

var sayNameFunc = cat.sayName.myBind(cat);
sayNameFunc();
