require 'rails_helper'

module Mutations
  module Events
    RSpec.describe CreateEvent, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
          @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
        end

        # it 'creates a dog' do
        #   user = create(:user)
        #   post '/graphql', params: { query: query(user_id: user.id) }
        # end.to change { Dog.count }.by(1)

        it 'creates an event' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createEvent][:event]

          expect(data).to include(
            id: Event.last.id.to_s,
            dog: {
              id: "#{@dog.id}",
              name: "#{@dog.name}",
              breed: "#{@dog.breed}",
              age: @dog.age,
              user: {
                name: "#{@user.name}"
              }
            },
            name: 'Potty training',
            completed: false
          )
          expect(data[:eventDatetime][0..9]).to eq("2021-08-27")
        end

        def query
          <<~GQL
            mutation {
              createEvent(
                input: {
                  name: "Potty training"
                  dogId: #{@dog.id}
                  completed: false
                  eventDatetime: "2021-08-27"
                }
              ) {
                event {
                  id
                  dog {
                    id
                    name
                    breed
                    age
                    user {
                      name
                    }
                  }
                  name
                  completed
                  eventDatetime
                }
              }
            }
          GQL
        end
      end
    end
  end
end
