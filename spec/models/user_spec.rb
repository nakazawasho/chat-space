require 'rails_helper'

describe '#create' do
  it 'is valid with a name, email, password password_confirmation' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = build(:user, name: "")
    user.valid?
    expect(user.errors[:name]).to include("を入力してください。")
  end

  it 'is invalid without an email' do
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください。")
  end

  it 'is invalid without a password' do
    user = build(:user, password: "")
    user.valid?
    expect(user.errors[:password]).to include("を入力してください。")
  end

  it 'is invalid without a password_confirmation but a password' do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
  end

  it 'is invalid when password and password_confirmation are different' do
    user = build(:user, password: "aaaa1111", password_confirmation: "1111aaaa")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
  end

  it 'is valid with a password not less than 8 characters' do
    user = build(:user, password: "abcd1234", password_confirmation: "abcd1234")
    expect(user).to be_valid
  end

  it 'is invalid with a password not more than 7 characters' do
    user = build(:user, password: "abc1234")
    user.valid?
    expect(user.errors[:password]).to include("は8文字以上で入力してください。")
  end

  it "is invalid with a duplicate email" do
    user = create(:user)
    another_user = build(:user)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します。")
  end

  it 'is invalid with email not including @' do
    user = build(:user, email: "nakazawa")
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です。")
  end
end
