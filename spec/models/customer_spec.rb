require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'Customer exists' do
    customer1 = create(:customer)

    expect(customer1).to be_kind_of(Customer)
    expect(customer1[:first_name]).not_to be_empty
    expect(customer1[:first_name]).to be_kind_of(String)

    expect(customer1[:last_name]).not_to be_empty
    expect(customer1[:last_name]).to be_kind_of(String)
  end

  describe 'Customer Validations' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe 'Customer Relationships' do
    it { should have_many :invoices }
  end
end
