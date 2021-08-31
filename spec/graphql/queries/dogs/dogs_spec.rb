require 'rails_helper'

module Queries
  RSpec.describe Types::DogType, type: :request do
    describe '.resolve' do
      it 'returns all dogs' do
        user = create(:user)
        dog1 = create(:dog, user: user, name: 'Hero', age: 4, breed: 'Poodle')
        dog2 = create(:dog, user: user, name: 'Tiger', age: 8, breed: 'Poodle')

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:dogs]

        expect(data).to eq([{:age=>4,
                            :breed=>"Poodle",
                            :id=>"#{dog1.id}",
                            :name=>"Hero",
                            :user=> {
                              :name=>"#{user.name}"
                            }
                          },
                            {:age=>8,
                            :breed=>"Poodle",
                            :id=>"#{dog2.id}",
                            :name=>"Tiger",
                            :user=>{
                              :name=>"#{user.name}"
                            }
                            }])
      end
    end

    def query
      <<~GQL
      query {
        dogs {
          id
          user {
            name
          }
          name
          breed
          age
        }
      }
      GQL
    end
  end
end
