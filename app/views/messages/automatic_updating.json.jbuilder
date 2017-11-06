if @update_messages.present?
  messages = @update_messages
  json.array! messages do |message|
    json.content message.content
    json.image_url message.image_url
    json.user_name message.user.name
    json.created_time message.created_time
  end
end
