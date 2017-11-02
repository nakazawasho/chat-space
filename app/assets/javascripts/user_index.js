$(document).on('turbolinks:load', function() {

  var search_list = $("#user-search-result");

  var chat_members_list = $("#chat-group-users");

  function appendUserToChatMembers(user_id, user_name){
    var add_user = `<div class="chat-group-user clearfix">
                     <input name="group[user_ids][]" type="hidden" value="${user_id}">
                     <p class="chat-group-user__name">${user_name}</p>
                     <a class="user-search-add chat-group-user__btn chat-group-user__btn--remove" data-user-id="${user_id}" data-user-name="${user_name}">削除</a>
                    </div>`
    chat_members_list.append(add_user);
  }

  function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                 <p class="chat-group-user__name">${user.name}</p>
                 <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    search_list.append(html);
  }

  function appendNoUser(user){
    var html = `<li>
                  <div class='listview__element--right-icon'>${ user }</div>
                </li>`
    search_list.append(html);
  }

  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendNoUser("一致するユーザーはいません");
      }
    })
    .fail(function(){
      alert('ユーザ検索に失敗しました')
    })
  });

  $("#user-search-result").on("click", ".chat-group-user__btn--add", function(){
    var user_id = this.getAttribute("data-user-id");
    var user_name = this.getAttribute("data-user-name");
    appendUserToChatMembers(user_id, user_name);
  });

  $("#chat-group-users").on("click", ".chat-group-user__btn--remove", function(){
      console.log(this)
    this.remove();

  });
});
