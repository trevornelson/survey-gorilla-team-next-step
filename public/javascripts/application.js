// Javascript Goes Here~
//
$(document).ready(function() {
  $("#login").click(function() {
    $("#signform").hide();
    $("#logform").fadeIn("slow");
  });

  $("#signup").click(function() {
    $("#logform").hide();
    $("#signform").fadeIn("slow");
  });
  // $("#anime").click(function() {
    var gorilla = $("#greeting");
       gorilla.animate({height: '400px', opacity: '0.6'}, "slow");

        gorilla.animate({height: '600px', opacity: '1'}, "slow");


});