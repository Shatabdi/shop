$(function() {
    $( "#user_dob" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  });


$(document).ready(function(){
	$("#user_name , #user_email, #user_address, #user_city, #user_state, #user_country, #user_password, #user_password_confirmation").focus(function(){
		$(this).css("background-color", "#F4FA58")
	});
	$("#user_name , #user_email, #user_address, #user_city, #user_state, #user_country, #user_password, #user_password_confirmation").blur(function(){
    $(this).css("background-color","#ffffff");
  }); 
  $("body").on("click", "input[type='submit']",function(e) 
    var isValid = true;
    $("#user_name , #user_email, #user_address, #user_password").each(function() {
       if ($.trim($(this).val()) == '') {
          isValid = false;
          $(this).after("field cannot be blank");
        }
        
    });
      if($("#user_password").val() != $("#user_password_confirmation").val()){
      alert("password and password confirmation does not match");
      isvalid = false;
      }
    if (isValid == false){
        e.preventDefault();}
  });
});













