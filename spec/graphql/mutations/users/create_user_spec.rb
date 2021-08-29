require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        it 'creates a user' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createUser][:user]

          expect(data).to eq({
            id: User.last.id.to_s,
            name: "User1"
          })
        end

        def query
          <<~GQL
            mutation {
              createUser(
                input: {
                  name: "User1"
                }
              ) {
                user {
                  id
                  name
                }
              }
            }
          GQL
        end
      end
    end
  end
end
