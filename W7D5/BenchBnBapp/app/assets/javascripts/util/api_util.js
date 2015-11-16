var ApiUtil = window.ApiUtil = function(){

};

ApiUtil.fetchAllBenches = function(){
  var filterParams = FilterParamsStore.all();
  $.ajax({
    url: "/api/benches",
    type: "GET",
    contentType: "application/json",
    data: {bounds: filterParams.bounds, seating: filterParams.seating},
    success: function(data){
      ApiActions.receiveAllBenches(data);
    }
  });
};

ApiUtil.createBench = function(benchObj){
  $.ajax({
    url: "/api/benches",
    type: "POST",
    dataType: "json",
    ContentType: "application/json",
    data: {bench: benchObj},
    success: function(data){
      ApiActions.receiveAllBenches(data);
    }
  });
};
