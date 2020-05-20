require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'Merchant exists' do
    merchant1 = create(:merchant)

    expect(merchant1).to be_kind_of(Merchant)
    expect(merchant1[:name]).not_to be_empty
    expect(merchant1[:name]).to be_kind_of(String)
  end

  describe 'Merchant Validations' do
    it { is_expected.to have_db_column(:id).of_type(Integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should validate_presence_of :name }
  end

  describe 'Merchant Relationships' do
    it { should have_many :items }
  end
end
