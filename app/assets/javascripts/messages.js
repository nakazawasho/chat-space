$(function() {
   function buildHTML(message){
     var head = `<div class="message">
                   <div class="message__name-date">
                     <ul>
                      <li class="list-name">
                         ${message.user_name}
                       </li>
                     <li class="list-date">
                         ${message.created_time}
                       </li>
                     </ul>
                   </div>`;
     var foot = `</div>`;
     var contentAndMessage = `<div class="message__text">
                               <p>
                                 ${message.content}
                               </p>
                               <img src="${message.image_url}">
                              </div>`;
     var content = `<div class="message__text">
                      <p>
                        ${message.content}
                      </p>
                    </div>`;
     var image = `<div class="message__text">
                    <img src="${message.image_url}">
                  </div>`;
     if (message.content != null && message.image_url != null){
       return head + contentAndMessage + foot;
     } else if(message.content != null && message.image_url == null){
       return head + content +foot;
     } else {
       return head + image + foot;
     }
   };
   $("#new_message").on('submit', function(e){
     e.preventDefault();
     var formData = new FormData(this);
     var url = $(this).attr('action');
     $.ajax({
       url: url,
       type: "POST",
       data: formData,
       dataType: 'json',
       processData: false,
       contentType: false
     })
    .done(function(data){
      if (data.success != null){
        var success_html = `<div class="flash flash__notice">${data.success}</div>`;
        var html = buildHTML(data);
        $(".messages").append(html);
        $(".textarea").val('');
        $("#message_image").val('');
        $(".chat-main__body").animate({scrollTop: $(".messages:last-child")[0].scrollHeight}, 'slow');
        $(".send-button").prop("disabled", false);
        $(".chat-side").before(success_html)
        $(".flash__notice:not(:animated)").fadeIn("slow",function(){
          $(this).delay(2000).fadeOut();
        });
      } else if ( data.unsuccess != null) {
        var unsuccess_html = `<div class="flash flash__alert">${data.unsuccess}</div>`;
        $(".chat-side").before(unsuccess_html);
        $(".flash__alert:not(:animated)").fadeIn("slow",function(){
          $(this).delay(2000).fadeOut();
        });
        $(".send-button").prop("disabled", false);
      }
    })
    .fail(function(){
      $('.send-button').prop("disabled", false);
    });
  });
});
