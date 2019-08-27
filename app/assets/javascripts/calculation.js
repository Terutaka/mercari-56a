$(document).on('turbolinks:load', function() {

  $("#input_price").on("keyup",function(){
    $("#fee").empty();
    $("#calculation").empty();
    var input = $("#input_price").val();
    if (input>=300 & input<10000000){
      var tesuryo = input * 0.1;
      var tesuryo = Math.floor(tesuryo);
      $("#fee").text("￥"+tesuryo);
      var rieki = input * 0.9;
      var rieki = Math.ceil(rieki);
      $("#calculation").text("￥"+rieki);
    };
  });
});