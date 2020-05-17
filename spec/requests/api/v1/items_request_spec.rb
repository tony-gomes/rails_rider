require 'rails_helper'

describe 'Items Resource' do
  it 'Items Index' do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items.count).to eql(3)

    expect(items.first).to be_kind_of(Hash)
    expect(items.first.count).to eql(6)
    expect(items.first[:id]).not_to eql(items.last[:id])
    expect(items.first[:id].length).to eql(36)
    expect(items.first[:name]).not_to be_empty

    expect(items.last).to be_kind_of(Hash)
    expect(items.last[:id]).not_to eql(items.first[:id])
    expect(items.last.count).to eql(6)
    expect(items.last[:id].length).to eql(36)
    expect(items.last[:name]).not_to be_empty
  end
end
