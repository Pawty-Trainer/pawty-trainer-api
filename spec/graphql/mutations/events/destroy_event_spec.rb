require 'rails_helper'

module Mutations
  module Events
    RSpec.describe DestroyEvent, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
          @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
          @event = create(:event, dog: @dog , name: 'walk', completed: true, event_datetime: "2001-09-11" )
        end

        it 'deletes an event' do
          post '/graphql', params: { query: query(id: @event.id) }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:destroyEvent][:event]

          expect(data).to eq nil
          expect(Event.last).to eq(nil)
        end

        def query(id:)
          <<~GQL
          mutation {
            destroyEvent(input: {id: #{@event.id}}) {
               id
            }
          }
          GQL
        end
      end
    end
  end
end
