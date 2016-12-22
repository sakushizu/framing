$(function() {

  // コメント表示view組み立て
  function buildHTML(comment) {
    var html = $('<li class="comment-text">').append(comment.text);
    return html;
  }

  // 自動スクロール
  function scrollToBottom() {
    $('.comments-box').scrollTop( $('#comment-list').height() );
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    comment = $('#comment-text').val();
    $.ajax({
      type: 'POST',
      url: document.location.href + '/comments.json',
      data: {
        comment: {
          text: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('#comment-list').append(html);
      $('#comment-text').val('');
      scrollToBottom();
    })
    .fail(function() {
      alert('error');
    });
  });
});

