require 'rails_helper'

RSpec.describe 'Inventories New Page' do
  describe "as a visitor" do
    before(:each) do

      @potatoes = Product.create!(name: "Potatoes", unit_price: 15.65, storage_requirement: "rt_perishable")
      @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")

      visit new_warehouse_product_path
    end

    it 'has a form to create a new warehouse_product' do

      fill_in 'Product ID:', with: "#{@potatoes.id}"
      fill_in 'Quantity:', with: "10"
      fill_in 'Warehouse ID:', with: "#{@denver_warehouse.id}"
      click_button 'Save'

      warehouse_product = WarehouseProduct.last
      total_value = @potatoes.unit_price * 10

      expect(current_path).to eq(warehouse_products_path)
      expect(warehouse_product.product_id).to eq(@potatoes.id)
      expect(warehouse_product.quantity).to eq(10)
      expect(warehouse_product.unit_price).to eq(@potatoes.unit_price)
      expect(warehouse_product.total_value).to eq(total_value)
      # expect(page).to have_content("New WarehouseProduct Has Been Created!")
    end
  end
end
