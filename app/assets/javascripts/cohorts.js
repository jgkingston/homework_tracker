$(document).on('click', '.assignment', function(){
  console.log("Hello")
  console.log($(this).attr('assignment_id'))
  $.ajax({
    url: $('.status-report').attr('ajax_path'),
    dataType: "script",
    type: "GET",
    data: {q: $(this).attr('assignment_id')}
  })
})

$(function(){
  $(window).scroll(function(){
    var aTop = $('.cohort-side-bar').height()+70;
    if($(this).scrollTop()>=aTop){
      $('.cohort-side-bar').addClass("affix")
    }
    else {
      $('.cohort-side-bar').removeClass("affix")
    }
  });
});