json.image_url @message.image_url
json.user_name @message.user.name
json.created_time @message.created_time
json.content @message.content
json.success flash.now[:notice] = "メッセージ送信成功"
