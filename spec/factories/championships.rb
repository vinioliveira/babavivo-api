FactoryGirl.define do

  factory :metric do
    name "MyString"
  end

  factory :championship do
    name "Cool Name"
    day_of_week 1
    start_time "2014-11-09 12:18:16"
    draw_date "2014-11-09 12:18:16"
    place "Cool Place"
    outfield_players 4
    type_teams 'S'
    association :creator, factory: :user
    after(:build){|c| c.metrics = [FactoryGirl.create(:metric)]}
  end
end
