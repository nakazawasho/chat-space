FactoryGirl.define do

  factory :message do
    content  { Faker::Lorem.sentence }
    image    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/sample.jpg')) }
    group
    user
    created_at  { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at  { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end

end
