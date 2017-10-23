$(function(){
  function buildHTML(message){
    if (message.content != null && message.image_url != null){
      var html = `<div class="message">
                    <div class="message__name-date">
                      <ul>
                        <li class="list-name">
                          ${message.user_name}
                        </li>
                        <li class="list-date">
                          ${message.created_time}
                        </li>
                      </ul>
                    </div>
                  <div class="message_text">
                    <p>
                      ${message.content}
                    </p>
                      <img src="${message.image_url}">
                    </div>
                  </div>`
      return html;
    } else if(message.content != null && message.image_url == null){
      var html = `<div class="message">
                    <div class="message__name-date">
                      <ul>
                        <li class="list-name">
                          ${message.user_name}
                        </li>
                        <li class="list-date">
                          ${message.created_time}
                        </li>
                      </ul>
                    </div>
                    <div class="message_text">
                      <p>
                        ${message.content}
                      </p>
                    </div>
                  </div>`
      return html;
    } else {
      var html = `<div class="message">
                    <div class="message__name-date">
                      <ul>
                        <li class="list-name">
                          ${message.user_name}
                        </li>
                        <li class="list-date">
                          ${message.created_time}
                        </li>
                      </ul>
                    </div>
                    <div class="message_text">
                      <img src="${message.image_url}">
                    </div>
                  </div>`
      return html;
    }
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html)
      $('.textarea').val('')
      $('#message_image').val('')
      $('.chat-main__body').animate({scrollTop: $(".messages:last-child")[0].scrollHeight}, 'slow');
      $('.send-button').prop("disabled", false)
    })
    .fail(function(){
      alert('error');
      $('.send-button').prop("disabled", false)
    })
  });
});
