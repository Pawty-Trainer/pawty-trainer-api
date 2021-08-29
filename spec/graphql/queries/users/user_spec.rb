require 'rails_helper'

module Queries
  RSpec.describe Types::UserType, type: :request do
    describe '.resolve' do
      before :each do
        User.destroy_all
        @user = create(:user, name: 'Tester')
      end

      it 'returns a user' do
        post '/graphql', params: { query: query }

        json = JSON.parse(response.body, symbolize_names: true)
        data = json[:data][:user]

        expect(data).to eq({
                            :id=>"#{@user.id}",
                            :name=>"Tester"})
      end
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
end
