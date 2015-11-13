(function(){

  var _benches = [];
  var _bench = [];

  var BenchStore = window.BenchStore = $.extend({}, EventEmitter.prototype);

  var BENCHES_CHANGE = "benches_change";

  BenchStore.addChangeListener = function(callback){
    this.on(BENCHES_CHANGE, callback);
  };

  BenchStore.removeChangeListener = function(callback){
    this.removeListener(BENCHES_CHANGE, callback);
  };

  BenchStore.changed = function(){
    this.emit(BENCHES_CHANGE);
  };

  BenchStore.dispatcherId = AppDispatcher.register(function(payload){
    switch (payload.actionType) {
      case BenchConstants.BENCHES_RECIEVED:
        BenchStore.store(payload.benches);
        break;
    }
  });

  BenchStore.store = function(benches){
    _benches = benches;
    this.changed();
  };

  BenchStore.all = function(){
    return _benches.slice();
  };

  BenchStore.fetch = function(bounds){
    ApiUtil.fetchAllBenches(bounds);
  };



})();
