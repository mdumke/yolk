FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    email      { FFaker::Internet.safe_email(first_name) }
    power_animal { FFaker::Food.fruit }

    password '123'
  end
end

