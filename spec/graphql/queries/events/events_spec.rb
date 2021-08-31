require 'rails_helper'

module Queries
  RSpec.describe Types::EventType, type: :request do
    describe '.resolve' do
      it 'returns all events' do
        user = create(:user)
        dog = create(:dog, user: user)

        event1 = create(:event, dog: dog, name: 'walk', completed: true, event_datetime: "2013-01-01")
        event2 = create(:event, dog: dog, name: 'sit', completed: false, event_datetime: "2021-01-01")

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:events]

        expect(data).to eq([{:name=>"walk",
                            :completed=>true,
                            :id=>"#{event1.id}",
                            :eventDatetime=>"2013-01-01T00:00:00Z",
                            :dogId=>dog.id,
                            :dog=>{
                              :name=>"#{dog.name}",
                              :breed=>"#{dog.breed}",
                              :age=>dog.age,
                              :userId=>user.id,
                              :user=>{
                                :name=>"#{user.name}"
                              }
                            }
                          },
                            {:name=>"sit",
                            :completed=>false,
                            :id=>"#{event2.id}",
                            :eventDatetime=>"2021-01-01T00:00:00Z",
                            :dogId=>dog.id,
                            :dog=>{
                              :name=>"#{dog.name}",
                              :breed=>"#{dog.breed}",
                              :age=>dog.age,
                              :userId=>user.id,
                              :user=>{
                                :name=>"#{user.name}"
                              }
                            }
                          }])
      end
    end

    def query
      <<~GQL
      query {
        events {
          id
          dogId
          dog {
            name
            breed
            age
            userId
            user {
              name
            }
          }
          name
          completed
          eventDatetime
        }
      }
      GQL
    end
  end
end
