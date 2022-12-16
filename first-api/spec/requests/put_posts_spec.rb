require 'rails_helper'

RSpec.describe 'Posts', type: :request do 
  describe 'PUT /v1/posts/{id}' do 
    context 'with valid parameters' do
      let!(:my_post) { FactoryBot.create(:post) }

      before do 
        post '/v1/posts', params: 
                              {
                                post: {
                                  title: my_post.title,
                                  content: my_post.content
                                }
                              }

        put '/v1/posts/1', params: 
                              {
                                post: {
                                  title: my_post.title + "Edited",
                                  content: my_post.content + "Edited"
                                }
                              }

      end

      it 'returns the title' do 
        expect(json['title']).to eq(my_post.title + "Edited")
      end

      it 'returns the content' do 
        expect(json['content']).to eq(my_post.content + "Edited")
      end

      it 'returns a ok status' do 
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do 
      before do 
        post '/v1/posts', params: 
                              {
                                post: {
                                  title: 'Title',
                                  content: 'Content'
                                }
                              }

        put '/v1/posts/1', params: 
                              {
                                post: {
                                  title: '',
                                  content: ''
                                }
                              }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end