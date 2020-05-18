FactoryBot.define do
  factory :item do
    association :merchant
    name { "MyString" }
    description { "MyText" }
    unit_price { 1 }
  end
end
