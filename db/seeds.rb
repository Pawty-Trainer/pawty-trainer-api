# please uncomment this code for local test usage
# code is left commented out for Heroku - Heroku has issues w/ Faker
# 5.times do
#   user = User.create(
#       name: Faker::Movies::StarWars.character,
#   )

#   5.times do
#       dog = user.dogs.create(
#           name: Faker::Creature::Dog.name,
#           age: rand(1..24),
#           breed: Faker::Creature::Dog.breed
#       )

#     5.times do
#       dog.events.create(
#         name: Faker::Verb.base,
#         completed: Faker::Boolean.boolean(true_ratio: 0.2),
#         event_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
#       )
#     end
#   end
# end
