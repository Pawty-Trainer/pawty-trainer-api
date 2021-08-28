require 'rails_helper'

module Queries
  RSpec.describe Types::EventType, type: :request do
    describe '.resolve' do
      xit 'returns a event' do
        user = create(:user)
        dog = create(:dog, user: user, name: 'Hero', age: 4, breed: 'Poodle')
        event1 = create(:event, dog: dog, name: 'walk', completed: true, event_datetime: "2013-01-01")


        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['event']

        expect(data).to eq([{"name"=>"walk",
                            "completed"=>true,
                            "id"=>"#{event1.id}",
                            "eventDatetime"=>"2013-01-01T00:00:00Z",
                            "dogId"=>dog.id}])
      end
    end

    def query
      <<~GQL
      query {
        event(id: 1) {
          id
          dogId
          name
          completed
          eventDatetime
        }
      }
      GQL
    end
  end
end
