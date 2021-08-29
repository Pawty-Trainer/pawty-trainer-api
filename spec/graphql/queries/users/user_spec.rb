require 'rails_helper'

module Queries
  RSpec.describe Types::UserType, type: :request do
    describe '.resolve' do
      xit 'returns a user' do
        user = create(:user, name: 'Tester')

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['user']

        expect(data).to eq([{
                            "id"=>"#{user.id}",
                            "name"=>"Tester"}])
      end
    end

    def query
      <<~GQL
      query {
        user(id: 1) {
          id
          name
        }
      }
      GQL
    end
  end
end
