class Mutations::UpdateDog < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :breed, String, required: false
    argument :age, String, required: false

    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :dog, Types::DogType, null: true

    def resolve(id:, **arguments)
        dog = Dog.find(id)

        if dog.update(arguments)
            { success: true, dog: dog, errors: [] }
        else
            { success: false, event: nil, errors: record.errors.full_messages }
        end
    end
end
