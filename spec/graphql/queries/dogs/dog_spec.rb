require 'rails_helper'

module Queries
  RSpec.describe Types::DogType, type: :request do
    before :each do
      User.destroy_all
      @user = create(:user)
      @dog = create(:dog, user: @user, name: 'Hero', age: 4, breed: 'Poodle')
    end
    
    describe '.resolve' do
      context 'returns a specific dog successfully' do
        it 'returns a dog' do
          post '/graphql', params: { query: query }
  
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:dog]
  
          expect(data).to eq({:age=>4,
                              :breed=>"Poodle",
                              :id=> "#{@dog.id}",
                              :name=>"Hero",
                              :userId=>@user.id,
                              :user=>{
                                :name=>"#{@user.name}"
                              }
                            })
        end
  
        def query
          <<~GQL
          query {
            dog(id: "#{@dog.id}") {
              id
              userId
              user {
                name
              }
              name
              breed
              age
            }
          }
          GQL
        end
      end

      context 'returns an error' do
        it 'returns an error when no dog id exists' do
          post '/graphql', params: { query: query }
  
          json = JSON.parse(response.body, symbolize_names: true)
          error = json[:errors].first[:message]
  
          expect(error).to eq("Couldn't find Dog")
        end
    
        def query
          <<~GQL
          query {
            dog(id: "10000") {
              id
              userId
              user {
                name
              }
              name
              breed
              age
            }
          }
          GQL
        end
      end
    end
  end
end
