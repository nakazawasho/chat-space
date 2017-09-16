require 'rails_helper'

describe '#create' do
  it 'is valid with a content, image, group_id, user_id, created_at, updated_at' do
    message = build(:message)
    expect(message).to be_valid
  end

end
