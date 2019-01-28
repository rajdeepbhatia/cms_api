require 'rails_helper'

RSpec.describe 'Contents', type: :request do

  before do
    FactoryBot.create(:content, status: :published, id: 1)
  end

  it 'should return contents' do
    get '/contents'
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response.content_type).to eq('application/vnd.api+json')
    expect(response).to have_http_status(:success)
    expect(response_body['data'].length).to eq 1
    expect(response_body['data'][0]['id']).to eq '1'
  end
end
