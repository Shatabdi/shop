// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-1.9.1
//= require jquery-ui
//= require_tree .
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
  $("body").on("click", "input[type='submit']",function(e) {
    var isValid = true;
    $("#user_name , #user_email, #user_address, #user_password").each(function() {
       if ($.trim($(this).val()) == '') {
          isValid = false;
          $(this).after("field cannot be blank");
        }
        
    });
      if($("#user_password").val() != $("#user_password_confirmation").val()){
      alert("password and password confirmation does not match");
      isValid = false;
      }
    if (isValid == false)
        e.preventDefault();
  });
});

