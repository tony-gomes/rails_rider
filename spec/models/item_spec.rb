require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'Item exists' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)

    expect(item1).to be_kind_of(Item)
    expect(item1[:merchant_id]).to be_kind_of(Integer)
    expect(item1[:merchant_id]).not_to be_empty
    expect(item1[:name]).not_to be_empty
    expect(item1[:name]).to be_kind_of(String)
    expect(item1[:description]).to be_kind_of(String)
    expect(item1[:unit_price]).to be_kind_of(Integer)
  end

  describe 'Item Relationships' do
    it { should belong_to :merchant }
  end
end
