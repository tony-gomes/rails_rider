require 'rails_helper'

describe 'Search Show' do
  it 'Items / Find Endpoint Exact Match' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)

    merchant2 = create(:merchant, name: "Test String")
    item3 = create(:item, merchant_id: merchant2.id, name: "Test Item")

    get "/api/v1/items/find?name=test_item"

    expect(response).to be_successful
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:id]).to eql(item3.id)
    expect(item[:merchant_id]).to eql(merchant2.id)
    expect(item[:name]).to eql(item3.name)

    expect(item[:id]).not_to eql(item1.id)
    expect(item[:merchant_id]).not_to eql(merchant1.id)
    expect(item[:name]).not_to eql(item1.name)
  end
end
