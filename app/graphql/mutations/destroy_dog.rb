module Mutations
  class DestroyDog < BaseMutation
    field :id, ID, null: true

    argument :id, ID, required: true

    def resolve(id:)
      dog = Dog.find(id)

      dog.destroy
      {
        id: id,
      }
    end
  end
end
