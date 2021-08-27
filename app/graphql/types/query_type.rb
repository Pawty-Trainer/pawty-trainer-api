module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    # include GraphQL::Types::Relay::HasNodeField
    # include GraphQL::Types::Relay::HasNodesField

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :dogs, [Types::DogType], null: false
    def dogs
      Dog.all
    end

    field :dog, Types::DogType, null: false do
      argument :id, ID, required: true
    end

    def dog(id:)
      Dog.find(id)
    end

    field :events, [Types::EventType], null: false
    def events
      Event.all
    end

    field :event, Types::EventType, null: false do
      argument :id, ID, required: true
    end

    def event(id:)
      Event.find(id)
    end
  end
end
