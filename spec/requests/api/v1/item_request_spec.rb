require 'rails_helper'

describe 'Items Resource' do
  it 'Item Index' do
    merchant1 = create(:merchant)
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items.count).to eql(3)

    expect(items.first).to be_kind_of(Hash)
    expect(items.first.count).to eql(7)
    expect(items.first[:merchant_id]).not_to be_empty
    expect(items.first[:id]).not_to eql(items.last[:id])
    expect(items.first[:id].length).to eql(36)
    expect(items.first[:name]).not_to be_empty
    expect(items.first[:description]).to be_kind_of(String)
    expect(items.first[:unit_price]).to be_kind_of(Integer)

    expect(items.last).to be_kind_of(Hash)
    expect(items.last[:id]).not_to eql(items.first[:id])
    expect(items.last.count).to eql(7)
    expect(items.first[:merchant_id]).not_to be_empty
    expect(items.last[:id].length).to eql(36)
    expect(items.last[:name]).not_to be_empty
    expect(items.last[:description]).to be_kind_of(String)
    expect(items.last[:unit_price]).to be_kind_of(Integer)
  end

  it 'Item Show' do
    merchant1 = create(:merchant)
    id = create(:item, merchant_id: merchant1.id).id

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

  it 'Item Create' do
    merchant1 = create(:merchant)
    item_params = {
                    merchant_id: merchant1.id,
                    name: 'Some Item',
                    description: 'Some Description',
                    unit_price: 76_939_283
                  }

    post '/api/v1/items', params: { item: item_params }
    item1 = Item.last

    expect(response).to be_successful
    expect(item1.name).to eql(item_params[:name])
    expect(item1.description).to eql(item_params[:description])
    expect(item1.unit_price).to eql(item_params[:unit_price])
  end

  it 'Item Update' do
    merchant1 = create(:merchant)
    id = create(:item, merchant_id: merchant1.id).id
    previous_name = Item.last.name
    item_params = {
                    name: 'Some Item',
                    description: 'Some Description',
                    unit_price: 76_939_283
                  }

    put "/api/v1/items/#{id}", params: { item: item_params }
    item = Item.find_by(id: id)

    expect(response).to be_successful

    expect(item.name).to_not eql(previous_name)
    expect(item.name).to eql('Some Item')

    expect(item.description).to_not eql(previous_name)
    expect(item.description).to eql('Some Description')

    expect(item.unit_price).to_not eql(previous_name)
    expect(item.unit_price).to eql(76_939_283)
  end

  it 'Item Destroy' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)

    expect(Item.count).to eql(1)

    expect { delete "/api/v1/items/#{item1.id}" }.to change(Item, :count).by(-1)

    expect(response).to be_successful
    expect(Item.count).to be_zero
    expect { Item.find(item1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'Item by Merchant' do
    merchant1 = create(:merchant)
    _item1 = create(:item, merchant_id: merchant1.id)

    merchant2 = create(:merchant)
    item2 = create(:item, merchant_id: merchant2.id)

    get "/api/v1/items/#{item2.id}/merchant"

    expect(response).to be_successful
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:id]).not_to eql(merchant1.id)
    expect(merchant[:id]).to eql(merchant2.id)
    expect(merchant[:id]).not_to eql(merchant2.name)
  end
end
