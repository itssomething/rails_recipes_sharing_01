//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets

// $('.add_child').click(function() {
//   var association = $(this).attr('data-association');
//   var target = $(this).attr('target');
//   var regexp = new RegExp('new_' + association, 'g');
//   var new_id = new Date().getTime();
//   var Dest = (target == '') ? $(this).parent() : $('#'+target);
//   Dest.append(window[association+'_fields'].replace(regexp, new_id));
//   return false;
// });

// $(document).delegate('.remove_child','click', function() {
//   $(this).parent().children('.removable')[0].value = 1;
//   $(this).parent().hide();
//   return false;
// });

$("[data-form-prepend]").click(function(e) {
  var obj = $($(this).attr("data-form-prepend"));
  obj.find("input, select, textarea").each(function() {
    $(this).attr("name", function() {
      return $(this)
        .attr("name")
        .replace("new_record", new Date().getTime());
    });
  });
  obj.insertBefore(this);
  return false;
});
