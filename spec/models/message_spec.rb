require 'rails_helper'

describe '#create' do
  it 'is valid with a content, image, group_id, user_id, created_at, updated_at' do
    message = build(:message)
    expect(message).to be_valid
  end

  it 'is valid with a content, group_id, user_id, created_at, updated_at' do
    message = build(:message, image: "")
    expect(message).to be_valid
  end

  it 'is valid with an image, group_id, user_id, created_at, updated_at' do
    message = build(:message, content: "")
    expect(message).to be_valid
  end

  it 'is invalid without a content, image' do
    message = build(:message, content: "", image: "")
    message.valid?
    expect(message.errors[:content]).to include("を入力してください。")
    expect(message.errors[:image]).to include("を入力してください。")
  end

  it 'is invalid without a group_id' do
    message = build(:message, group_id: "")
    message.valid?
    expect(message.errors[:group]).to include("を入力してください")
  end

  it 'is invalid without a user_id' do
    message = build(:message, user_id: "")
    message.valid?
    expect(message.errors[:user]).to include("を入力してください")
  end

end
