$(document).on('click', '.workflow-options a', function(){

  $.ajax({
    url: $('.workflow-options').attr('ajax_path'),
    dataType: "script",
    type: "GET",
    data: {event: $(this).attr('event')}
  })
})