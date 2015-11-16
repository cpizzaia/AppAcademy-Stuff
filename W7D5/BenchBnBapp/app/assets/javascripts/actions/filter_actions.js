var FilterActions = window.FilterActions = function(){

};

FilterActions.receiveAllFilterParams = function(data){
  AppDispatcher.dispatch({
    actionType: FilterParamsConstants.FILTER_PARAMS_RECIEVED,
    filterParams: data
  });
};
