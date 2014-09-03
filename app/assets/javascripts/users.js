$(document).on('click', '.users-by-location', function(){
  var id = '.location_'+$(this).attr('location_id')
  $('.users').hide()
  $(id).removeClass('hidden').show()
})