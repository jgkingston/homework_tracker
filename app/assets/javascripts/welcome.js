$(function() {
    $( "#accordion" ).accordion();
  });

$(document).on('click', '.cohort', function(){
  console.log("Hello")
  console.log($(this).attr('ajax_path'))
  $.ajax({
    url: $(this).attr('ajax_path'),
    dataType: "script",
    type: "GET",
    // data: {q: $(this).attr('cohort_id')}
  })
})

$(document).on('click', '.student-header', function(){
  var id = '.'+$(this).attr('student_id')+'_assignments'
  console.log(id)
  $('.assignments').hide()
  $(id).removeClass('hidden').show()
})

