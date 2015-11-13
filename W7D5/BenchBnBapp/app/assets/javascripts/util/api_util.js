var ApiUtil = window.ApiUtil = function(){

};

ApiUtil.fetchAllBenches = function(bounds){
  $.ajax({
    url: "/api/benches",
    type: "GET",
    contentType: "application/json",
    data: {bounds: bounds},
    success: function(data){
      ApiActions.receiveAllBenches(data);
    }
  });
};
