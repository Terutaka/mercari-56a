$(document).on('turbolinks:load', function() {

  function child_select(){
    var html = `<select name=child-select,class=contents__item-about_box_condition_input", id="child-form">
                  <option value="---">---</option>
                </select>`
    return html;
  };

  function grand_select(){
    var html = `<select name=child-select,class=contents__item-about_box_condition_input", id="grand-form">
                  <option value="0">---</option>
                </select>`

    return html;
  }

  function cate_value(cate) {
    var html =`<option value="${cate.id}">${cate.name}</option>`

    return html;
  };

  $("#parent-form").change(function(){
    var parents = $(this).val();
    if (parents > 0){
      $.ajax({
        url: '/items/select',
        type: 'get',
        dataType: 'json',
        data: {parent_id: parents}
      })
      .done(function(select){
        $("#child-form,#grand-form").remove();
        var html =  child_select();
        $(".__category-wrap").append(html);
        select.forEach(function(child){
          var html = cate_value(child);
          $("#child-form").append(html);
        });
      })
    } else{
      $("#child-form,#grand-form").remove();
    }
  });

  $(document).on("change","#child-form",function(){
    var children = $(this).val();
    if (children > 0){
      $.ajax({
        url: '/items/select',
        type: 'get',
        dataType: 'json',
        data: {child_id: children}
      })
      .done(function(select){
        $("#grand-form").remove();
        var html =  grand_select();
        $(".__category-wrap").append(html);
        select.forEach(function(grand){
          var html = cate_value(grand);
          $("#grand-form").append(html);
        });
      })
    }else{
      $("#grand-form").remove();
    }
  })
  $(document).on("change","#grand-form",function(){
    var grand = $(this).val();
    console.log(grand);
    
  });
});