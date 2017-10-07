FactoryGirl.define do
  pass = Faker::Internet.password(8)

  factory :user do
    name                   Faker::Name.name
    email                  Faker::Internet.email
    password               pass
    password_confirmation  pass

    after(:create) do |user|
      group = create(:group)
      create(:member, user: user, group: group)
    end
  end

end
