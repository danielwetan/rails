require 'rails_helper'

RSpec.describe 'Posts', type: :request do 
  describe 'GET /v1/posts/{id}' do 
    before do 
      FactoryBot.create_list(:post, 10)
      get '/v1/posts/1'
    end

    it 'returns all posts' do 
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do 
      expect(response).to have_http_status(:success)
    end
  end
end