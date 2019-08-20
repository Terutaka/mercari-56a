$(document).on('turbolinks:load', function() {

  $("#input_price").on("keyup",function(){
    $("._list_text").empty();
    $("#calculation").empty();
    var input = $("#input_price").val();
    if (input.length >= 1){
      var tesuryo = input * 0.1;
      var tesuryo = Math.floor(tesuryo);
      $("._list_text").text(tesuryo);
      var rieki = input * 0.9;
      var rieki = Math.ceil(rieki);
      $("#calculation").text(rieki);
    };
  });
});