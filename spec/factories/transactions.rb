FactoryBot.define do
  factory :transaction do
    association :invoices

    credit_card_number { "MyString" }
    credit_card_expiration { "MyString" }
  end
end
