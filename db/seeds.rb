power_animals = ['Sloth', 'Panda', 'Giraffe', 'Mule', 'Butterfly']
farm_names = ["Mary's Little Lamb", "Walter's Vogelweide",
              "Fat Ugly Pig Farm", "Bernds Bauernhof",
              "Johnny's Family Farm", "Animal Farm"]

puts 'create users'

5.times do
  User.create(
    first_name:  FFaker::Name.first_name,
    last_name:   FFaker::Name.last_name,
    email:       FFaker::Internet.email,
    password:    '123',
    power_animal: power_animals.sample
  )
end

puts 'create farms'

farm_names.each do |farm_name|
  Farm.create(
    name: farm_name,
    street: "#{FFaker::Address.street_name} #{rand(1..50)}",
    zip_code: FFaker::AddressDE.zip_code,
    city: FFaker::AddressDA.city,
    country: FFaker::Address.country
  )
end

puts 'create reviews'

Farm.all.each do |farm|
  number_of_reviews = rand(1..4)
  reviewers = User.all.shuffle

  number_of_reviews.times do
    Review.create(
      reviewer: reviewers.pop,
      farm: farm,
      rating: rand(1..5),
      body: FFaker::BaconIpsum.paragraph
    )
  end
end

