FactoryBot.define do
  factory :invoice_item do
    association :item
    association :invoice
    quantity { 1 }
    unit_price { 1 }
  end
end
