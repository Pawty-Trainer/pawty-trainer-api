require 'rails_helper'

module Queries
  RSpec.describe Types::DogType, type: :request do
    before :each do
      User.destroy_all
      @user = create(:user)
      @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
    end
    describe '.resolve' do
      it 'returns a dog' do
        post '/graphql', params: { query: query}

        json = JSON.parse(response.body)
        data = json['data']['dog']

        expect(data).to eq({"age"=>4,
                            "breed"=>"Poodle",
                            "id"=> "#{@dog.id}",
                            "name"=>"Hero",
                            "userId"=> @user.id})
      end

      def query
        <<~GQL
        query {
          dog(id: "#{@dog.id}") {
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
end
