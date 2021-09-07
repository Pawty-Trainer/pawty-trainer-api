require 'rails_helper'

module Queries
  RSpec.describe Types::UserType, type: :request do
    describe '.resolve' do
      before :each do
        User.destroy_all
        @user = create(:user, name: 'Tester')
      end

      context 'returns a user based on id successfully' do
        it 'returns a user' do
          post '/graphql', params: { query: query }

          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:user]

          expect(data).to eq({
                              :id=>"#{@user.id}",
                              :name=>"Tester"})
        end

        def query
          <<~GQL
          query {
            user(id: "#{@user.id}") {
              id
              name
            }
          }
          GQL
        end
      end

      context 'returns an error' do
        it 'returns an error when id does not exist' do
          post '/graphql', params: { query: query }

          json = JSON.parse(response.body, symbolize_names: true)
          error = json[:errors].first[:message]

          expect(error).to eq("Couldn't find User")
        end

        def query
          <<~GQL
          query {
            user(id: "10000") {
              id
              name
            }
          }
          GQL
        end
      end
    end
  end
end
