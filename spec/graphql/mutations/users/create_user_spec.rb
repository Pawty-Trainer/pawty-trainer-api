require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      describe '.resolve' do
        context 'creates a user successfully' do
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

        context 'returns error' do
          it 'returns error when query is blank' do
            post '/graphql', params: { query: query_error }
            json = JSON.parse(response.body, symbolize_names: true)
            # binding.pry
            errors = json[:errors].first

            expect(json[:user]).to eq(nil)
            expect(errors[:message]).to eq("Cannot return null for non-nullable field CreateUserPayload.user")
          end

          def query_error
            <<~GQL
              mutation {
                createUser(
                  input: {
                    name: ""
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
end
