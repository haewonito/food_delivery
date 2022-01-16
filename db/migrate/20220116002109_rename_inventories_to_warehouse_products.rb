class RenameInventoriesToWarehouseProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :inventories, :warehouse_products
  end
end
