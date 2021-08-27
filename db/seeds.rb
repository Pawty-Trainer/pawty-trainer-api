# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 5.times do
#   user = User.create(name: :user.name, email: :user.email, password_digest: :user.password_digest)
# end

5.times do
    user = User.create(
        name: Faker::Movies::StarWars.character,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )

    5.times do
        user.dogs.create(
            name: Faker::Creature::Dog.name,
            age: rand(1..24),
            breed: Faker::Creature::Dog.breed
        )
    end
end