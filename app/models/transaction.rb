class Transaction < ApplicationRecord
  belongs_to :invoice

  validates :result, presence: true
  validates :credit_card_number, presence: true
  validates :credit_card_expiration_date, presence: true
end
