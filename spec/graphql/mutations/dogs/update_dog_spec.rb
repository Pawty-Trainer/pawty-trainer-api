require 'rails_helper'

module Mutations
  module Dogs
    RSpec.describe UpdateDog, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
          @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
        end

        context 'update a dog' do
          it 'update a dog successfully' do
            post '/graphql', params: { query: query(id: @dog.id) }

            json = JSON.parse(response.body, symbolize_names: true)
            data = json[:data][:updateDog][:dog]

            expect(data).to eq({
              id: "#{@dog.id}",
              name: "Fido",
              breed: "Aussie",
              age: 3,
              user: {
                name: "#{@user.name}"
              }
            })
          end

          def query(id:)
            <<~GQL
            mutation {
              updateDog(input: { id: #{@dog.id}, name: "Fido", age: "3", breed: "Aussie"}) {
                dog {
                    id
                    user {
                      name
                    }
                    name
                    breed
                    age
                }
              }
            }
            GQL
          end
        end

        context 'returns an error' do
          it 'returns an error when update is incorrect' do
            post '/graphql', params: { query: query(id: @dog.id) }

            json = JSON.parse(response.body, symbolize_names: true)
            dog = json[:data][:updateDog][:dog]

            expect(dog).to eq(nil)
          end

          def query(id:)
            <<~GQL
            mutation {
              updateDog(input: { id: #{@dog.id}, name: "", age: "3", breed: "Aussie"}) {
                dog {
                    id
                    user {
                      name
                    }
                    name
                    breed
                    age
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
