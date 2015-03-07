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

});