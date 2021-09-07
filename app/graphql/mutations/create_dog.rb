class Mutations::CreateDog < Mutations::BaseMutation
  argument :name, String, required: true
  argument :breed, String, required: true
  argument :age, Integer, required: true
  argument :user_id, Integer, required: true

  field :dog, Types::DogType, null: false
  field :errors, [String], null: false

  def resolve(name:, breed:, age:, user_id:)
    dog = Dog.new(name: name, breed: breed, age: age, user_id: user_id)
    if dog.save
      {
        dog: dog,
        errors: []
      }
    else
      raise GraphQL::ExecutionError, dog.errors.full_messages.to_sentence
    end
  end
end
