class AddInvoiceToInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoice_items, :invoice, foreign_key: true
  end
end
