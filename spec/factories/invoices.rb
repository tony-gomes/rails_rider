FactoryBot.define do
  factory :invoice do
    association :merchant
    association :customer

    status { "MyString" }
  end
end
