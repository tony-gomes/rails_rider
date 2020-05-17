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
    expect(items.first[:description]).to be_kind_of(String)
    expect(items.first[:unit_price]).to be_kind_of(Integer)

    expect(items.last).to be_kind_of(Hash)
    expect(items.last[:id]).not_to eql(items.first[:id])
    expect(items.last.count).to eql(6)
    expect(items.last[:id].length).to eql(36)
    expect(items.last[:name]).not_to be_empty
    expect(items.last[:description]).to be_kind_of(String)
    expect(items.last[:unit_price]).to be_kind_of(Integer)

  end

  it 'Item Show' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:id]).to eq(id)
    expect(item[:id]).to be_kind_of(String)
    expect(item[:id].length).to eql(36)
    expect(item[:name]).not_to be_empty
    expect(item[:id].length).to eql(36)
    expect(item[:name]).not_to be_empty
    expect(item[:description]).to be_kind_of(String)
    expect(item[:unit_price]).to be_kind_of(Integer)
  end

  it 'Items Create' do
    item_params = {
                        name: 'Some Item',
                        description: 'Some Description',
                        unit_price: 76939283
                      }

    post '/api/v1/items', params: { item: item_params }
    item1 = Item.last

    expect(response).to be_successful
    expect(item1.name).to eql(item_params[:name])
    expect(item1.description).to eql(item_params[:description])
    expect(item1.unit_price).to eql(item_params[:unit_price])

  end
end
