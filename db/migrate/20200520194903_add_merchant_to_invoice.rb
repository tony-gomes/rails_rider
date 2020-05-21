class AddMerchantToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :merchant, foreign_key: true
  end
end
