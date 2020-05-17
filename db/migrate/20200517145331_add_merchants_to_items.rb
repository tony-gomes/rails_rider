class AddMerchantsToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :merchant, type: :uuid, foreign_key: true
  end
end
