class RemoveTotalValueFromWarehouseProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :warehouse_products, :unit_price
  end
end
