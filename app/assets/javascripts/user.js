$(document).on("ready page:load", function() {
  $("li").on("click", function() {
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".post-container").hide();
    $("." + this.id).show();
    console.log($(this).prop('src'))
  });
});
