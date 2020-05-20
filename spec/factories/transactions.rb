FactoryBot.define do
  factory :transaction do
    association :invoice

    credit_card_number { "MyString" }
    credit_card_expiration_date { "MyString" }
    result { "MyString" }
  end
end
