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

        context 'update an event' do
          it 'update an event successfully' do
            post '/graphql', params: { query: query(id: @event.id) }

            json = JSON.parse(response.body, symbolize_names: true)
            event = json[:data][:updateEvent][:event]

            expect(event).to eq({
              id: "#{@event.id}",
              name: "run",
              completed: false,
              # eventDatetime: "2001-09-11T06:00:00Z",
              dogId: @dog.id,
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
               dogId
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

        context 'returns error' do
          it 'returns an error when event name is blank' do
            post '/graphql', params: { query: query(id: @event.id) }

            json = JSON.parse(response.body, symbolize_names: true)
            event = json[:data][:updateEvent][:event]

            expect(event).to eq(nil)
          end

          def query(id:)
            <<~GQL
            mutation {
            updateEvent(input: { id: #{@event.id}, name: "", completed: false, eventDatetime: "2001-09-11"}) {
              event {
               id
               name
               completed
               dogId
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
end
