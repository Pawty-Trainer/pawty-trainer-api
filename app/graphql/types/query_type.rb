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
      begin
        User.find(id)
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message.split(' with').first
      end
    end

    field :dogs, [Types::DogType], null: false
    def dogs
      Dog.all
    end

    field :dog, Types::DogType, null: false do
      argument :id, ID, required: true
    end

    def dog(id:)
      begin
        Dog.find(id)
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message.split(' with').first
      end
    end

    field :events, [Types::EventType], null: false
    def events
      Event.all
    end

    field :event, Types::EventType, null: false do
      argument :id, ID, required: true
    end

    def event(id:)
      begin
        Event.find(id)
      rescue ActiveRecord::RecordNotFound => error
        raise GraphQL::ExecutionError, error.message.split(' with').first
      end
    end
  end
end
