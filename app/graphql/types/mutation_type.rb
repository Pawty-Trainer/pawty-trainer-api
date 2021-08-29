module Types
  class MutationType < Types::BaseObject
    field :destroy_event, mutation: Mutations::DestroyEvent
    field :destroy_dog, mutation: Mutations::DestroyDog
    field :create_user, mutation: Mutations::CreateUser
    field :create_dog, mutation: Mutations::CreateDog
    field :create_event, mutation: Mutations::CreateEvent
    field :update_event, mutation: Mutations::UpdateEvent
    field :update_dog, mutation: Mutations::UpdateDog
    # field :create_link, mutation: Mutations::CreateLink
  end
end
