require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it 'InvoiceItem exists' do
    invoice_item1 = create(:invoice_item)

    expect(invoice_item1).to be_kind_of(InvoiceItem)
    expect(invoice_item1[:quantity]).to be_kind_of(Integer)
    expect(invoice_item1[:unit_price]).to be_kind_of(Integer)
  end

  describe 'InvoiceItem Validations' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
  end

  describe 'InvoiceItem Relationships' do
    it { should belong_to :item }
    it { should belong_to :invoice }
  end
end
