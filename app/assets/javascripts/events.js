function hide_addIcon() {
  $("#addIcon").hide();
}

function switch_addIcon_to_new_event( e ) {
  e.preventDefault();
  e.stopImmediatePropagation();
  $("#addIcon").hide();
  $('#new_event').show();
}

function switch_new_event_to_addIcon() {
  $("#new_event").hide();
  $('#addIcon').show();
}

// FLASH NOTICE ANIMATION
var fade_flash = function() {
    $("#flash_notice").delay(5000).fadeOut("slow");
    $("#flash_alert").delay(5000).fadeOut("slow");
    $("#flash_error").delay(5000).fadeOut("slow");
};
fade_flash();

var show_ajax_message = function(msg, type) {
    $("#flash-message").html('<div id="flash_'+type+'">'+msg+'</div>');
    fade_flash();
};



$(document).ready(function() {
  // add the timepicker to the datetime field
  $('#event_startdatetime').datetimepicker({dateFormat: "DD, d MM, yy", timeFormat: "h:mm TT"});

  // hide the form
  $("#new_event").hide();

  $('a#addIcon img').on('click', switch_addIcon_to_new_event);
  // what to do when the form is successfully filled out
  $("#new_event").on("ajax:complete", switch_new_event_to_addIcon)

  // after any ajax request, inform the user about what happened.
  $(document).ajaxComplete(function(event, request) {
    var msg = request.getResponseHeader('X-Message');
    var type = request.getResponseHeader('X-Message-Type');
    show_ajax_message(msg, type); //use whatever popup, notification or whatever plugin you want
});
});