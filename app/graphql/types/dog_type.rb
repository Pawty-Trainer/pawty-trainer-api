module Types
  class DogType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :user, Types::UserType, null: true
    field :breed, String, null: true
    field :name, String, null: true
    field :age, Integer, null: true
    field :events, [Types::EventType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
