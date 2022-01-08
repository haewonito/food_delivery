class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :location_name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
