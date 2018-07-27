$(document).ready(function () {
  curr_people = parseFloat($("#current-people").text());
  no_ingredients = parseInt($(".no_ingredients").text());
  static_amounts = [];

  for (i = 1; i <= no_ingredients; i++) {
    static_amounts[i] = parseFloat($(".ingredient-amount-" + i).text());
  }

  $("#calc-btn").click(function () {

    no_people = parseFloat($("#calc-amount").val());
    $("#no-people").text(no_people) ;
    if(no_people <= 0 || Number.isNaN(no_people)) {
      alert(I18n.t("invalid_number")) ;
      return;
    }

    new_amounts = [];

    for (i = 1; i <= no_ingredients; i++) {
      new_amounts[i] = parseFloat($(".ingredient-amount-" + i).text());
      new_amounts[i] = parseFloat((static_amounts[i] / curr_people) * no_people);
      console.log(new_amounts[i]);
    }

    for (i = 1; i <= no_ingredients; i++) {
      $(".ingredient-amount-" + i).text(new_amounts[i]);
    }
  });
});
