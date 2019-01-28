require 'rails_helper'

RSpec.describe 'Contents', type: :request do

  before do
    FactoryBot.create(:content, status: :published, id: 1)
    FactoryBot.create(:content, status: :draft, id: 2)
  end

  it 'should respond with success status' do
    get '/contents'
    expect(response).to have_http_status(:success)
  end

  it 'should return only published content' do
    get '/contents'
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response_body['data'].length).to eq 1
    expect(response_body['data'][0]['id']).to eq '1'
  end

  it 'should return content in json format' do
    get '/contents'
    expect(response.content_type).to eq('application/vnd.api+json')
  end
end
