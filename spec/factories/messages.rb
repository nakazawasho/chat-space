FactoryGirl.define do

  factory :message do
    content     { Faker::Lorem.sentence }
    image       { fixture_file_upload('spec/fixtures/image/sample.jpg', 'image/jpg') }
    group_id    { Faker::Number.number(2) }
    user_id     {Faker::Number.number(2) }
    created_at  { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at  { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end

end
