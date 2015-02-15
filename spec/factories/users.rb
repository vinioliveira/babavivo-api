FactoryGirl.define do
  factory :user do
    email  Faker::Internet.email
    password  "superscretpassword"
    name  Faker::Name.name
    nickname  "jhondoe"
  end

end
