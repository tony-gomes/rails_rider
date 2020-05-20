require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'Transaction exists' do
    @transaction1 = create(:transaction)

    expect(@transaction1).to be_kind_of(Transaction)
    expect(@transaction1[:result]).to be_kind_of(String)
    expect(@transaction1[:credit_card_number]).to be_kind_of(String)
    expect(@transaction1[:credit_card_expiration_date]).to be_kind_of(String)
  end

  describe 'Transaction Validations' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should validate_presence_of :result }
    it { should validate_presence_of :credit_card_number }
    it { should validate_presence_of :credit_card_expiration_date }
  end

  describe 'Transaction Relationships' do
    it { should belong_to :invoice }
  end
end
