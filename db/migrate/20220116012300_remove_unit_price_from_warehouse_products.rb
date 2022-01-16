class RemoveUnitPriceFromWarehouseProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :warehouse_products, :total_value
  end
end
