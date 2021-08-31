module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    # field :dog_id, Integer, null: true
    field :dog, Types::DogType, null: true
    field :name, String, null: true
    field :completed, Boolean, null: true
    field :event_datetime, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
