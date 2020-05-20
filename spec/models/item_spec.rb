require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'Item exists' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)

    expect(item1).to be_kind_of(Item)
    expect(item1[:id]).to eql(item1.id)

    expect(item1[:merchant_id]).to be_kind_of(Integer)
    expect(item1[:merchant_id]).to eql(merchant1.id)
    expect(item1[:merchant_id]).not_to eql(merchant2.id)

    expect(item1[:name]).to eql(item1.name)
    expect(item1[:name]).to be_kind_of(String)

    expect(item1[:description]).to eql(item1.description)
    expect(item1[:description]).to be_kind_of(String)

    expect(item1[:unit_price]).to eql(item1.unit_price)
    expect(item1[:unit_price]).to be_kind_of(Integer)
  end

  describe 'Item Relationships' do
    it { should belong_to :merchant }
  end
end
