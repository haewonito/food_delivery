class AddQuantityAvailableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :quantity_available, :integer
  end
end
