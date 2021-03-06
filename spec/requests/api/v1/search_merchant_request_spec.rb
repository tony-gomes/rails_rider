require 'rails_helper'

describe 'Search Show' do
  it 'Merchants / Find Endpoint Exact Match' do
    merchant1 = create(:merchant, name: "Test String")

    get "/api/v1/merchants/find?name=test_string"

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(merchant[:name]).to eql(merchant1.name)
  end

  it 'Merchants / Find Endpoint w/ Partials' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant, name: "Test String")

    get "/api/v1/merchants/find?name=test"

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:id]).not_to eql(merchant1.id)
    expect(merchant[:name]).not_to eql(merchant1.name)
  end

    it 'Merchants / Find Endpoint w/ Date' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)

      get "/api/v1/merchants/find?created_at=#{merchant2.created_at}"

      expect(response).to be_successful
      merchant = JSON.parse(response.body, symbolize_names: true)

      # expect(merchant.count).to eql(4)
      # expect(merchant[:id]).to eql(merchant2[:id])
    end
end
