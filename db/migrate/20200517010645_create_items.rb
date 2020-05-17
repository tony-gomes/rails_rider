class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :unit_price

      t.timestamps
    end
  end
end