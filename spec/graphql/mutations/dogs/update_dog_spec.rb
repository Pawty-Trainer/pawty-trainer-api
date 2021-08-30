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


        it 'update a dog' do
          post '/graphql', params: { query: query(id: @dog.id) }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:updateDog][:dog]

          expect(data).to eq({
            id: "#{@dog.id}",
            name: "Fido",
            breed: "Aussie",
            age: 3,
            userId: @user.id
          })
        end

        def query(id:)
          <<~GQL
          mutation {
            updateDog(input: { id: #{@dog.id}, name: "Fido", age: "3", breed: "Aussie"}) {
              dog {
                  id
                  userId
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
