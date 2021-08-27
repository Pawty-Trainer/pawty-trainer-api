FactoryBot.define do
  factory :dog do
    breed { Faker::Creature::Dog.breed }
    name { Faker::Creature::Dog.breed }
    age { rand(1..24) }
  end
end
