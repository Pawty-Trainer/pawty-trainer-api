require 'rails_helper'

module Mutations
  module Dogs
    RSpec.describe CreateDog, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
        end

        context 'creates a dog' do
          it 'creates a dog successfully' do
            post '/graphql', params: { query: query }
            json = JSON.parse(response.body, symbolize_names: true)
            data = json[:data][:createDog][:dog]

            expect(data).to eq({
              id: Dog.last.id.to_s,
              name: 'Roger',
              breed: 'Poodle',
              age: 9,
              user: {
                id: "#{@user.id}",
                name: @user.name
              }
            })
          end

          def query
            <<~GQL
              mutation {
                createDog(
                  input: {
                    userId: #{@user.id}
                    name: "Roger"
                    breed: "Poodle"
                    age: 9
                  }
                ) {
                  dog {
                    id
                    name
                    breed
                    age
                    user {
                      id
                      name
                    }
                  }
                }
              }
            GQL
          end
        end

        context 'returns error' do
          it 'returns an error when dog is nil' do
            post '/graphql', params: { query: query_error }
            json = JSON.parse(response.body, symbolize_names: true)
            errors = json[:errors].first

            expect(json[:dog]).to eq(nil)
            expect(errors[:message]).to eq("Name can't be blank")
          end

          def query_error
            <<~GQL
              mutation {
                createDog(
                  input: {
                    userId: #{@user.id}
                    name: ""
                    breed: "Poodle"
                    age: 9
                  }
                ) {
                  dog {
                    id
                    name
                    breed
                    age
                    user {
                      id
                      name
                    }
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
