$(document).ready(function () {
  activeTabListener();

});

var activeTabListener = function(){
  $('ul.nav.navbar-nav').on('click','a',function(e){
    $('ul .active').removeClass('active');
    console.log($(this));
    $(this).addClass('active');
  })
}
