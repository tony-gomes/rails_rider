require 'rails_helper'

describe 'Merchant Resources' do
  it 'Merchant Index' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants.count).to eql(3)

    expect(merchants.first).to be_kind_of(Hash)
    expect(merchants.first.count).to eql(4)
    expect(merchants.first[:id]).not_to eql(merchants.last[:id])
    expect(merchants.first[:id].length).to eql(36)
    expect(merchants.first[:name]).not_to be_empty

    expect(merchants.last).to be_kind_of(Hash)
    expect(merchants.last[:id]).not_to eql(merchants.first[:id])
    expect(merchants.last.count).to eql(4)
    expect(merchants.last[:id].length).to eql(36)
    expect(merchants.last[:name]).not_to be_empty
  end
end
