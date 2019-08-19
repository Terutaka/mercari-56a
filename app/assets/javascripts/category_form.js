$(document).on('turbolinks:load', function() {

  $("#parent-form").change(function(){
    var parents = $(this).val();
    $.ajax({
      url: '//',
      type: 'get',
      dataType: 'json',
      data: {parent_id: parents}
    })
  });
});