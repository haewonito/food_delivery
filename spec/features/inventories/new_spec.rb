require 'rails_helper'

RSpec.describe 'Inventories New Page' do
  describe "as a visitor" do
    before(:each) do

      @potatoes = Product.create!(name: "Potatoes", unit_price: 15.65, storage_requirement: "rt_perishable")
      @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")

      visit new_inventory_path
    end

    it 'has a form to create a new inventory' do

      fill_in 'Product ID:', with: "#{@potatoes.id}"
      fill_in 'Quantity:', with: "10"
      fill_in 'Warehouse ID:', with: "#{@denver_warehouse.id}"
      click_button 'Save'

      inventory = Inventory.last
      total_value = @potatoes.unit_price * 10

      expect(current_path).to eq(inventories_path)
      expect(inventory.product_id).to eq(@potatoes.id)
      expect(inventory.quantity).to eq(10)
      expect(inventory.unit_price).to eq(@potatoes.unit_price)
      expect(inventory.total_value).to eq(total_value)
      # expect(page).to have_content("New Inventory Has Been Created!")
    end
  end
end
