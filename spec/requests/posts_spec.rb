require 'rails_helper'
RSpec.describe 'Post API', type: :request do
  # initialize test data
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }
  let(:headers) { valid_headers }

  # describe 'GET /posts' do
  #   before { get '/posts', params: {}, headers: headers }

  #   it 'returns posts' do
  #     # Note `json` is a custom helper to parse JSON responses
  #     expect(json).not_to be_empty
  #     expect(json.size).to eq(10)
  #   end

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
