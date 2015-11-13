var ApiActions = window.ApiActions = function(){

};

ApiActions.receiveAllBenches = function(data){
  AppDispatcher.dispatch({
    actionType: BenchConstants.BENCHES_RECIEVED,
    benches: data
  });
};
