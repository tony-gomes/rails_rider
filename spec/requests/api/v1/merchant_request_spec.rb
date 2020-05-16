require 'rails_helper'

describe 'Merchant Resources' do
  it 'Merchant Index' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
  end
end
