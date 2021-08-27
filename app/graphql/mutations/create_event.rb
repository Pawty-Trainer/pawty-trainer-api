class Mutations::CreateEvent < Mutations::BaseMutation
  argument :name, String, required: true
  argument :completed, Boolean, required: true
  argument :event_datetime, GraphQL::Types::ISO8601DateTime, required: true
  argument :dog_id, Integer, required: true

  field :event, Types::EventType, null: false
  field :errors, [String], null: false

  def resolve(name:, completed:, event_datetime:, dog_id:)
    event = Event.new(name: name, completed: completed, event_datetime: event_datetime, dog_id: dog_id)
    if event.save
      {
        event: event,
        errors: []
      }
    else
      {
        event: nil,
        errors: event.errors.full_messages
      }
    end
  end
end
