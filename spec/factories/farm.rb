FactoryGirl.define do
  factory :farm do
    name     { FFaker::Company.name }
    street   { "#{FFaker::Address.street_name} #{rand(1..50)}" }
    zip_code { FFaker::AddressDE.zip_code }
    city     { FFaker::AddressDA.city }
    country  { FFaker::Address.country }
  end
end

