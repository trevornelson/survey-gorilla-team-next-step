// Javascript Goes Here~
//
$(document).ready(function() {
  $("#login").click(function() {
    $("#signform").hide();
    $("#logform").show();
  });

  $("#signup").click(function() {
    $("#logform").hide();
    $("#signform").show();
  });
});