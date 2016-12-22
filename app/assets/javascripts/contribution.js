

function upload_image_user(field){
  fileLoad(field, function(e){
    $("#user_avatar").attr("src", e.currentTarget.result).css("display", "");
  });
};

function fileLoad(field, onLoadCallback) {
  var file = $(field).prop("files")[0],
  reader = new FileReader();
  reader.onload = onLoadCallback;
  reader.readAsDataURL(file);
}