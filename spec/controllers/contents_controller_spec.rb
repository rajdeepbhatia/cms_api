require 'rails_helper'

RSpec.describe ContentsController, type: :controller do
  describe 'GET #index' do
    before do
      FactoryBot.create(:content, status: :published)
      FactoryBot.create(:content, status: :draft)
    end

    it 'should return http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should respond with JSON body containing expected Contents' do
      get :index
      response_body = JSON.parse(response.body).with_indifferent_access
      expect(response_body[:data].length).to eq 1
      expect(response_body[:data][0].keys).to match_array(['id', 'type', 'attributes'])
      expect(response_body[:data][0][:attributes]).to match({
        'title'=>'Cool Content!',
        'published_date'=>'2019-01-27T21:42:13.000Z',
        'author'=>'Rajdeep',
        'summary'=>'This is an awesome article!',
        'content'=>'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
      })
    end
  end
end
