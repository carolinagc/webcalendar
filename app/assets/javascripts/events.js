function hide_addIcon() {
  $("#addIcon").hide();
}

function new_event_on_ajax_success(e, data, status, xhr) {
 alert("success");
 switch_new_event_to_addIcon();
}

function new_event_on_ajax_fail(e, data, status, xhr) {
 alert("Error");
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

$(document).ready(function() {
  // add the timepicker to the datetime field
  $('#event_startdatetime').datetimepicker({dateFormat: "DD, d MM, yy", timeFormat: "h:mm TT"});

  // hide the form
  $("#new_event").hide();

  $('a#addIcon img').on('click', switch_addIcon_to_new_event);
  // what to do when the form is successfully filled out
  $("#new_event").on("ajax:success", new_event_on_ajax_success)
                 .on("ajax:error", new_event_on_ajax_fail);
});