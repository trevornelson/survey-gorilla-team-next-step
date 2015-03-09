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

  $(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".survey-form-wrapper"); //Fields wrapper
    var add_button      = $("#add-btn"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<span><div><form action="/partial" name="question-' + x + '"" method="POST"><div class="input-group"><span class="input-group-addon" id="sizing-addon2">Q:</span><input type="text" class="form-control" placeholder="Input Question here..." aria-describedby="sizing-addon2"></div></form><br><form action="/partial" name="answer-1" method="POST"><ul><div class="input-group input-group-sm"><span class="input-group-addon" id="sizing-addon3">A:</span><input type="text" class="form-control" placeholder="Input Answer here..." aria-describedby="sizing-addon3"></div></ul>	</form>	<form action="/partial" name="answer-2" method="POST"><ul><div class="input-group input-group-sm">	<span class="input-group-addon" id="sizing-addon3">A:</span><input type="text" class="form-control" placeholder="Input Answer here..." aria-describedby="sizing-addon3"></div></ul>	</form><form action="/partial" name="answer-3" method="POST">	<ul><div class="input-group input-group-sm">		<span class="input-group-addon" id="sizing-addon3">A:</span>		<input type="text" class="form-control" placeholder="Input Answer here..." aria-describedby="sizing-addon3"></div></ul></form> </form><form action="/partial" name="answer-4" method="POST">	<ul><div class="input-group input-group-sm">		<span class="input-group-addon" id="sizing-addon3">A:</span>		<input type="text" class="form-control" placeholder="Input Answer here..." aria-describedby="sizing-addon3"></div></ul></form></div><br> <button class="remove_field">Remove</button></span>');}
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('span').remove(); x--;
    })
});
});