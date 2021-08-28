require 'rails_helper'

module Queries
  RSpec.describe Types::EventType, type: :request do
    describe '.resolve' do
      it 'returns all events' do
        user = create(:user)
        dog1 = create(:dog, user: user)

        event1 = create(:event, dog: dog1, name: 'walk', completed: true, event_datetime: "2013-01-01")
        event2 = create(:event, dog: dog1, name: 'sit', completed: false, event_datetime: "2021-01-01")

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['events']

        expect(data).to eq([{"name"=>"walk",
                            "completed"=>true,
                            "id"=>"#{event1.id}",
                            "eventDatetime"=>"2013-01-01T00:00:00Z",
                            "dogId"=>dog1.id},
                            {"name"=>"sit",
                            "completed"=>false,
                            "id"=>"#{event2.id}",
                            "eventDatetime"=>"2021-01-01T00:00:00Z",
                            "dogId"=>dog1.id}])
      end
    end

    def query
      <<~GQL
      query {
        events {
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
