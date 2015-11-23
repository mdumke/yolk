puts 'create users'

jean = User.create(
  first_name: 'Jean Paul',
  last_name: 'Sartre',
  email: 'jean@example.com',
  password: '123',
  power_animal: 'Hamster')

chuck = User.create(
  first_name: 'Chuck',
  last_name: 'Norris',
  email: 'chuck@example.com',
  password: '123',
  power_animal: 'Butterfly')

ada = User.create(
  first_name: 'Ada',
  last_name: 'Lovelace',
  email: 'ada@example.com',
  password: '123',
  power_animal: 'Sloth')


puts 'create farms'

farm_names = ["Mary's Little Lamb", "Walter's Vogelweide", "Animal Farm"]

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

Review.create(
  reviewer: chuck,
  farm: Farm.first,
  rating: 1,
  body: "What is this bullshit? I just asked them if I could maybe kill one of the bulls with a roundhouse kick or just shoot it in the head, and they started to talk about police and all that.")

Review.create(
  reviewer: chuck,
  farm: Farm.last,
  rating: 2,
  body: "They mainly have chicken, not really animals. You know, like real animals. Also I found out there's a book called animal farm. Funny coincidence. Hahaha. I think I'm not going to read it.")

Review.create(
  reviewer: jean,
  farm: Farm.second,
  rating: 3,
  body: "I saw a large number of cows there. They all looked very sad. But why? I mean, yes, life for them is repetitive, they don't see the daylight, they have their calfes taken from them and they get connected to weird machines all the time. But being unhappy about it, that is their choice. There is always a choice.")

Review.create(
  reviewer: jean,
  farm: Farm.last,
  rating: 5,
  body: "What a great place! All the animals seem to live toghether in some kind of well organized harmonic communion. Totally untouched by the nausea of existence. I wish I could live on a farm like that. I would be a horse.")

Review.create(
  reviewer: ada,
  farm: Farm.first,
  rating: 3,
  body: "I see a lot of potential for optimizing the meat production by streamlining the breeding process and separating concerns when it comes to growing versus feeding crops. It would also be helpful to introduce a new layer of abstraction with respect to milk extraction and shipping.")

