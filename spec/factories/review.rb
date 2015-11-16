FactoryGirl.define do
  factory :review do
    rating { rand(1..5) }
    body   { FFaker::Lorem.sentence }
    farm
    reviewer { build(:user) }
  end
end

