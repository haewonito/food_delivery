class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.float :unit_price
      t.integer :quantity
      t.float :total_value
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
