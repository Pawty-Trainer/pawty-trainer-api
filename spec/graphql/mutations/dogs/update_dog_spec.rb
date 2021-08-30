require 'rails_helper'

module Mutations
  module Dogs
    RSpec.describe UpdateDog, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
        end

        # it 'updates a dog data' do
        #   dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
        #   post '/graphql', params: { query: query(id: dog.id, user_id: @user.id) }
        #
        #   expect(dog.reload).to have_attributes(
        #     user_id: @user.id,
        #     name: 'Fido',
        #     age: 3,
        #     breed: 'Aussie'
        #   )
        # end

        xit 'returns a dog' do
          dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')

          post '/graphql', params: { query: query(id: dog.id) }

          json = JSON.parse(response.body, symbolize_names: true)
          binding.pry
          data = json[:data][:updateDog][:dog]

          expect(data).to eq({
            id: Dog.last.id.to_s,
            name: "Fido",
            breed: "Aussie",
            age: "3",
            userId: @user.id
          })
        end

        def query(id:)
          <<~GQL
            mutation {
              updateDog(
                input: {
                  id: #{id}
                  name: "Fido"
                  age: "3"
                  breed: "Aussie"
                }
              ) dog {
                id
                name
                age
                breed
                userId
              }
            }
          GQL
        end
      end
    end
  end
end
