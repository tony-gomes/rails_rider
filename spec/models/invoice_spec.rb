require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it 'Invoice exists' do
    invoice1 = create(:invoice)

    expect(invoice1).to be_kind_of(Invoice)
    expect(invoice1[:status]).not_to be_empty
    expect(invoice1[:status]).to be_kind_of(String)
  end

  describe 'Invoice Validations' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should validate_presence_of :status }
  end

  describe 'Invoice Relationships' do
    it { should belong_to :customer }
    it { should belong_to :merchant }

    it { should have_many :invoice_items }
    it { should have_many :transactions }
  end
end
