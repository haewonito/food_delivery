class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :unit_price
      t.string :storage_requirement

      t.timestamps
    end
  end
end
