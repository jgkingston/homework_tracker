$(function(){
  $(window).scroll(function(){
    var scrollBottom = $(window).scrollTop() + $(window).height();
    // console.log($(window).scrollTop())
    // console.log(scrollBottom)
    // console.log("Combined" + $(window).scrollTop() + scrollBottom)
    console.log(scrollBottom)
    console.log($('.comments').height())

    var aBottom = $('.comments').outerHeight() + 70;
    console.log(aBottom)
    if(scrollBottom <= aBottom){
      $('.new-comment').addClass("affix")
    }
    else {
      $('.new-comment').removeClass("affix")
    }
  });
});