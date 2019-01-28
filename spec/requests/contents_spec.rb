require 'rails_helper'

RSpec.describe 'Contents', type: :request do

  before do
    12.times do |i|
      FactoryBot.create(:content, status: :published, id: (i + 1))
    end
    FactoryBot.create(:content, status: :draft, id: 100)
  end

  it 'should respond with success status' do
    get '/contents.json'
    expect(response).to have_http_status(:success)
  end

  it 'should return only published content' do
    get '/contents.json'
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response_body['data'].length).to eq 10
    expect(response_body['data'][0]['id']).to eq '1'
  end

  it 'should return content in json format' do
    get '/contents.json'
    expect(response.content_type).to eq('application/vnd.api+json')
  end

  it 'should return only 10 records at max' do
    get '/contents.json'
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response_body['data'].length).to eq 10
  end

  it 'should return 2 records when offset is passed as 1' do
    get '/contents.json?page=2'
    response_body = JSON.parse(response.body).with_indifferent_access
    expect(response_body['data'].length).to eq 2
  end
end
