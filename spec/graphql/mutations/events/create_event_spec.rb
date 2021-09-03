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

        context 'creates an event' do
          it 'creates an event successfully' do
            post '/graphql', params: { query: query }
            json = JSON.parse(response.body, symbolize_names: true)
            data = json[:data][:createEvent][:event]

            expect(data).to include(
              id: Event.last.id.to_s,
              dogId: @dog.id,
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
                    name
                    completed
                    eventDatetime
                  }
                }
              }
            GQL
          end
        end

        context 'returns error' do
          it 'returns an error when event is nil' do
            post '/graphql', params: { query: query_error }
            json = JSON.parse(response.body, symbolize_names: true)
            errors = json[:errors].first

            expect(json[:event]).to eq(nil)
            expect(errors[:message]).to eq("Cannot return null for non-nullable field CreateEventPayload.event")
          end

          def query_error
            <<~GQL
              mutation {
                createEvent(
                  input: {
                    name: ""
                    dogId: #{@dog.id}
                    completed: false
                    eventDatetime: "2021-08-27"
                  }
                ) {
                  event {
                    id
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
end
