require 'rails_helper'

module Mutations
  module Dogs
    RSpec.describe DestroyDog, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
          @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
        end

        xit 'deletes a dog' do
          post '/graphql', params: { query: query(id: @dog.id) }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:destroyDog][:dog]

          expect(data).to eq nil
          # ({
          #   id: "#{@dog.id}"
          # })

          expect(@dog.name).to eq(nil)
        end

        def query(id:)
          <<~GQL
          mutation {
            destroyDog(input: {id: #{@dog.id}}) {
              id
            }
          }
          GQL
        end
      end
    end
  end
end
