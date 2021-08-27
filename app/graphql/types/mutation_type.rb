module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_dog, mutation: Mutations::CreateDog
    field :create_event, mutation: Mutations::CreateEvent
    # field :create_link, mutation: Mutations::CreateLink
  end
end
