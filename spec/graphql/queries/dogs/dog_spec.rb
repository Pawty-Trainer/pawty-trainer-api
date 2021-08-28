require 'rails_helper'

module Queries
  RSpec.describe Types::DogType, type: :request do
    describe '.resolve' do
      xit 'returns a dog' do
        user = create(:user)
        dog = create(:dog, user: user, name: 'Hero', age: 4, breed: 'Poodle')

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['dog']

        expect(data).to eq([{"age"=>4,
                            "breed"=>"Poodle",
                            "id"=> dog.id,
                            "name"=>"Hero",
                            "userId"=> user.id}])
      end
    end

    def query
      <<~GQL
      query {
        dog(id: 1) {
          id
          userId
          name
          breed
          age
        }
      }
      GQL
    end
  end
end
