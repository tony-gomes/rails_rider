# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Merchants CSV
merchant_csv_read = File.read(Rails.root.join('lib', 'seeds', 'merchants.csv'))
merchant_csv = CSV.parse(merchant_csv_read, :headers => true, :encoding => 'ISO-8859-1')
merchant_csv.each do |row|
  m = Merchant.new
  m.id = row['id']
  m.name = row['name']
  m.created_at = row['created_at']
  m.updated_at = row['updated_at']
  m.save
end

puts "There are now #{Merchant.count} rows in the Merchant table"

# Items CSV
item_csv_read = File.read(Rails.root.join('lib', 'seeds', 'items.csv'))
item_csv = CSV.parse(item_csv_read, :headers => true, :encoding => 'ISO-8859-1')
item_csv.each do |row|
  i = Item.new
  i.id = row['id']
  i.name = row['name']
  i.description = row['description']
  i.unit_price = row['unit_price']
  i.merchant_id = row['merchant_id']
  i.created_at = row['created_at']
  i.updated_at = row['updated_at']
  i.save
end

puts "There are now #{Item.count} rows in the Item table"

# Customers CSV
customers_csv_read = File.read(Rails.root.join('lib', 'seeds', 'customers.csv'))
customers_csv = CSV.parse(customers_csv_read, :headers => true, :encoding => 'ISO-8859-1')
customers_csv.each do |row|
  c = Customer.new
  c.first_name = row['first_name']
  c.last_name = row['last_name']
  c.name = c.first_name + " " + c.last_name
  c.created_at = row['created_at']
  c.updated_at = row['updated_at']
  i.save
end

puts "There are now #{Customer.count} rows in the Customers table"

# Invoices CSV
invoices_csv_read = File.read(Rails.root.join('lib', 'seeds', 'invoices.csv'))
invoices_csv = CSV.parse(invoices_csv_read, :headers => true, :encoding => 'ISO-8859-1')
invoices_csv.each do |row|
  i = Invoice.new
  i.id = row['id']
  i.customer_id = row['customer_id']
  i.merchant_id = row['merchant_id']
  i.status = row['status']
  i.created_at = row['created_at']
  i.updated_at = row['updated_at']
  i.save
end

puts "There are now #{Invoices.count} rows in the Customers table"

# InvoiceItems CSV
invoice_items_csv_read = File.read(Rails.root.join('lib', 'seeds', 'invoice_items.csv'))
invoice_items_csv = CSV.parse(invoice_items_csv_read, :headers => true, :encoding => 'ISO-8859-1')
invoice_items_csv.each do |row|
  i = InvoiceItems.new
  i.id = row['id']
  i.item_id = row['item_id']
  i.invoice_id = row['invoice_id']
  i.quantity = row['quantity']
  i.unit_price = row['unit_price']
  i.created_at = row['created_at']
  i.updated_at = row['updated_at']
  i.save
end

puts "There are now #{InvoiceItems.count} rows in the InvoiceItems table"

# Transactions CSV
transactions_csv_read = File.read(Rails.root.join('lib', 'seeds', 'transactions.csv'))
transactions_csv = CSV.parse(transactions_csv_read, :headers => true, :encoding => 'ISO-8859-1')
transactions_csv.each do |row|
  t = Transactions.new
  t.id = row['id']
  t.invoice_id = row['invoice_id']
  t.credit_card_number = row['credit_card_number']
  t.credit_card_expiration_date = row['credit_card_expiration_date']
  t.result = row['result']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end

puts "There are now #{Transactions.count} rows in the Transactions table"
