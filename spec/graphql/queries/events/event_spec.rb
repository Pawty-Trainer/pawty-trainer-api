require 'rails_helper'

module Queries
  RSpec.describe Types::EventType, type: :request do
    describe '.resolve' do
      before :each do
        User.destroy_all

        @user = create(:user)
        @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
        @event1 = create(:event, dog: @dog, name: 'walk', completed: true, event_datetime: "2013-01-01")
      end

      it 'returns a event' do
        post '/graphql', params: { query: query }
        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:event]

        expect(data).to eq({:name=>"walk",
                            :completed=>true,
                            :id=>"#{@event1.id}",
                            :eventDatetime=>"2013-01-01T00:00:00Z",
                            :dogId=>@dog.id,
                            :dog=>{
                              :name=>"#{@dog.name}",
                              :breed=>"#{@dog.breed}",
                              :age=>@dog.age,
                              :userId=>@user.id,
                              :user=>{
                                :name=>"#{@user.name}"
                              }
                            }
                          })
      end

      def query
        <<~GQL
        query {
          event(id: "#{@event1.id}") {
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
end
