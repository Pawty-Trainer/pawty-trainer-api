require 'rails_helper'

module Mutations
  module Dogs
    RSpec.describe CreateDog, type: :request do
      describe '.resolve' do
        before :each do
          User.destroy_all
          @user = create(:user)
        end

        # it 'creates a dog' do
        #   user = create(:user)
        #   post '/graphql', params: { query: query(user_id: user.id) }
        # end.to change { Dog.count }.by(1)

        it 'creates a dog' do
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
    end
  end
end
