require 'rails_helper'

describe 'Merchant Resources' do
  it 'Merchant Index' do
    create_list(:merchant, 3)

    get "/api/v1/merchants"

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

  it 'Merchant Show' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:id]).to eq(id)
    expect(merchant[:id]).to be_kind_of(String)
    expect(merchant[:id].length).to eql(36)
    expect(merchant[:name]).not_to be_empty
  end

  it 'Merchant Create' do
    merchant_params = { name: 'Some Merchant' }

    post "/api/v1/merchants", params: { merchant: merchant_params }
    merchant1 = Merchant.last

    expect(response).to be_successful
    expect(merchant1.name).to eql(merchant_params[:name])
  end

  it 'Merchant Update' do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params = { name: "Merchant Tester" }

    put "/api/v1/merchants/#{id}", params: { merchant: merchant_params}
    merchant1 = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant1.name).to_not eql(previous_name)
    expect(merchant1.name).to eql('Merchant Tester')
  end

  it 'Merchant Destroy' do
    merchant1 = create(:merchant)

    expect(Merchant.count).to eql(1)

    expect { delete "/api/v1/merchants/#{merchant1.id}" }.to change(Merchant, :count).by(-1)

    expect(response).to be_successful
    expect(Merchant.count).to be_zero
    expect { Merchant.find(merchant1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'Merchant Items Index' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    item3 = create(:item, merchant_id: merchant1.id)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response).to be_successful
    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eql(3)
    expect(items.first).to be_kind_of(Hash)
    expect(items.last).to be_kind_of(Hash)

    expect(items.first[:merchant_id]).to eql(merchant1.id)
    expect(items.first[:id]).to eql(item1.id)
    expect(items.first[:name]).to eql(item1.name)

    expect(items.last[:merchant_id]).to eql(merchant1.id)
    expect(items.last[:id]).to eql(item3.id)
    expect(items.last[:name]).to eql(item3.name)
  end
end
