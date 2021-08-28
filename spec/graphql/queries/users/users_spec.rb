require 'rails_helper'

module Queries
  RSpec.describe Types::UserType, type: :request do
    describe '.resolve' do
      it 'returns all users' do
        user1 = create(:user, name: 'Tester')
        user2 = create(:user, name: 'Tester2')

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['users']

        expect(data).to eq([{
                            "id"=>"#{user1.id}",
                            "name"=>"Tester"},
                            {"id"=>"#{user2.id}",
                              "name"=>"Tester2"}])
      end
    end

    def query
      <<~GQL
      query {
        users {
          id
          name
        }
      }
      GQL
    end
  end
end
