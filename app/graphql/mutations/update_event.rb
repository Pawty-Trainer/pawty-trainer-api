class Mutations::UpdateEvent < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :completed, Boolean, required: false
    argument :event_datetime, GraphQL::Types::ISO8601DateTime, required: false

    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :event, Types::EventType, null: true

    def resolve(id:, **arguments)
        event = Event.find(id)

        if event.update(arguments)
            { success: true, event: event, errors: [] }
        else
            { success: false, event: nil, errors: record.errors.full_messages }
        end
    end
end
