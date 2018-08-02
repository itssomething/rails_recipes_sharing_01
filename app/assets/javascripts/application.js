//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require i18n
//= require i18n.js
//= require i18n/translations

$(document).on("turbolinks:load", function() {

  $("form").on("click", ".add_fields", function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data("id"), "g");
    $(".fields").append($(this).data("fields").replace(regexp, time));
    return event.preventDefault() ;
  });

  $("form").on("click", ".remove_record", function(event) {
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest("div.step").hide();
    return event.preventDefault() ;

  });
});
