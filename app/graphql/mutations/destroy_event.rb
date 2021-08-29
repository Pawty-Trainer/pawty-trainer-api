module Mutations
  class DestroyEvent < BaseMutation
    field :id, ID, null: true

    argument :id, ID, required: true

    def resolve(id:)
      event = Event.find(id)

      event.destroy
      {
        id: id,
      }
    end
  end
end
