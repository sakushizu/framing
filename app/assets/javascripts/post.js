$(function() {

  // view組み立て
  function buildHTML(data) {

    var html =
    '<div class="post-box-wrapper">' +
    '<a href="posts/' + data.id + '" class="post-image">' +
    '<div class="post-box">' +
    '<img src="' + data.image.thumb.url + '">' +
    '</div>' +
    '<div class="cover-box japanese-font" style="font-weight: 300">' +
    data.title +
    '</div>' +
    '</a>' +
    '</div>';
    return html;
  }
  // 1秒ごとに更新
  if (location.pathname == "/") {
    setInterval(function(){
      console.log("interval")
      $.ajax({
        method: 'GET',
        url: '',
        data: {
          date: new Date().toISOString()
        },
        dataType: 'json',
        success: function(json) {
          var insertHTML = '';
          console.log(json)
          json.forEach(function(post){
            console.log(post)
            insertHTML += buildHTML(post);
          });

          $('.box-wrapper').prepend(insertHTML);

          },
        error: function(json) {
          alert('エラーが発生しました');
        }
      });
    }, 1 * 1000);
  };
});
