(function(){

  var _filterParams = [{}];

  var FilterParamsStore = window.FilterParamsStore = $.extend({}, EventEmitter.prototype);

  var FILTER_PARAMS_CHANGE = "filter_params_change";

  FilterParamsStore.addChangeListener = function(callback){
    this.on(FILTER_PARAMS_CHANGE, callback);
  };

  FilterParamsStore.removeChangeListener = function(callback){
    this.removeListener(FILTER_PARAMS_CHANGE, callback);
  };

  FilterParamsStore.changed = function(){
    this.emit(FILTER_PARAMS_CHANGE);
  };

  FilterParamsStore.addFilter = function(filter){
    _filterParams = [$.extend(_filterParams[0], filter)];
    BenchStore.fetch();
  };

  FilterParamsStore.dispatcherId = AppDispatcher.register(function(payload){
    switch (payload.actionType) {
      case FilterParamsConstants.FILTER_PARAMS_RECIEVED:
        FilterParams.store(payload.filterParams);
        break;
    }
  });


  FilterParamsStore.all = function(){
    return _filterParams.slice()[0];
  };




})();
