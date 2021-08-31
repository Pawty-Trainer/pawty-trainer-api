require 'rails_helper'

module Mutations
  module Events
    RSpec.describe UpdateEvent, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
          @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
          @event = create(:event, dog: @dog , name: 'walk', completed: true, event_datetime: "2001-09-11" )
        end

        it 'update an event' do
          post '/graphql', params: { query: query(id: @event.id) }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:updateEvent][:event]

          expect(data).to eq({
            id: "#{@event.id}",
            name: "run",
            completed: false,
            # eventDatetime: "2001-09-11T06:00:00Z",
            dog: {
              id: "#{@dog.id}",
              name: "#{@dog.name}",
              breed: "#{@dog.breed}",
              age: @dog.age,
              user: {
                name: "#{@user.name}"
              }
            }
          })
        end

        def query(id:)
          <<~GQL
          mutation {
          updateEvent(input: { id: #{@event.id}, name: "run", completed: false, eventDatetime: "2001-09-11"}) {
            event {
             id
             name
             completed
             dog {
               id
               name
               breed
               age
               user {
                 name
               }
             }
            }
           }
          }
          GQL
        end
      end
    end
  end
end
