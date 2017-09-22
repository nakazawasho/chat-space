require 'rails_helper'

describe '#create' do
  #messageモデルで有効なファクトリを持つこと
  it 'has a valid message_factory' do
    message = build(:message)
    expect(message).to be_valid
  end

  #imageに値が入っていなくても、contentに値が入って入れば有効である
  it 'is valid with a content' do
    message = build(:message, image: nil)
    expect(message).to be_valid
  end

  #contentに値が入っていなくても、imageに値が入って入れば有効である
  it 'is valid with an image' do
    message = build(:message, content: nil)
    expect(message).to be_valid
  end

  #contentとimageに値が入っていなければ、有効でない。
  it 'is invalid without a content, image' do
    message = build(:message, content: nil, image: nil)
    message.valid?
    expect(message.errors[:content]).to include("を入力してください。")
    expect(message.errors[:image]).to include("を入力してください。")
  end

  #group_idに値が入っていなければ、有効でない。
  it 'is invalid without a group_id' do
    message = build(:message, group_id: nil)
    message.valid?
    expect(message.errors[:group]).to include("を入力してください")
  end

  #user_idに値が入っていなければ、有効でない。
  it 'is invalid without a user_id' do
    message = build(:message, user_id: nil)
    message.valid?
    expect(message.errors[:user]).to include("を入力してください")
  end

end
