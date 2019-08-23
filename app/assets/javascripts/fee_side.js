$(document).on('turbolinks:load', function() {

  function fee_select(){
    var html = `<div class="__shipping_box_how">
                  <h4>配送の方法</h4>
                  <span>必須</span>
                  <select class="contents__shipping_box_how_input">
                    <option value="0">---</option>
                  </select>
                </div>`
    return html
  };

  function cate_value(cate) {
    var html =`<option value="${cate.id}">${cate.name}</option>`

    return html;
  };

  $("#fee_side_parent").on("change",function(){
    var fee_side = $(this).val();
    if (fee_side > 0){
      $.ajax({
        url: '/items/select',
        type: 'get',
        dataType: 'json',
        data: {fee_parent_id: fee_side}
      })
      .done(function(fee){
        $(".__shipping_box_how").remove();
        var html = fee_select();
        $(".__shipping_box_ancestory").append(html);
        fee.forEach(function(fee_child){
          var html = cate_value(fee_child);
          console.log(html);
          $(".contents__shipping_box_how_input").append(html);
        });
      });
    } else{
      $(".__shipping_box_how").remove();
    };
  });
  $(document).on("change",".contents__shipping_box_how_input",function(){
    var grand = $(this).val();
    console.log(grand);
    
  });
});