$(document).ready(function() {
  $("#div-new-model").hide();
  $("#new-model").bind("click", function(event) {
    event.preventDefault();
    $("#div-new-model").slideToggle("slow");
  });

  $("#div-new-category").hide();
  $("#new-category").bind("click", function(event) {
    event.preventDefault();
    $("#div-new-category").slideToggle("slow");
  });

  $("#div-other-category").hide();
  $("#other-category").bind("click", function(event) {
    $("#div-other-category").slideToggle("slow");
  });

  $("#div-other-model").hide();
  $("#other-model").bind("click", function(event) {
    $("#div-other-model").slideToggle("slow");
  });

  /* Progress Bar */
  $('body').show();
  $('.version').text(NProgress.version);
  NProgress.start();
  setTimeout(function() {
    NProgress.done();
    $('.fade').removeClass('out');
  }, 1000);
  $("#b-0").click(function() {
    NProgress.start();
  });
  $("#b-40").click(function() {
    NProgress.set(0.4);
  });
  $("#b-inc").click(function() {
    NProgress.inc();
  });
  $("#b-100").click(function() {
    NProgress.done();
  });

  /* Carousel set interval */
  $('#myCarousel').carousel({
          interval: 5000
  });
});
