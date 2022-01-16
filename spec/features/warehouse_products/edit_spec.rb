require 'rails_helper'

RSpec.describe 'Inventories Edit Page' do
  describe "as a visitor" do
    before(:each) do

      @potatoes = Product.create!(name: "Potatoes", unit_price: 15.65, storage_requirement: "rt_perishable")
      @onions = Product.create!(name: "Onions", unit_price: 12.50, storage_requirement: "rt_perishable")

      @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
      @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")

      @warehouse_product = WarehouseProduct.create!(unit_price: 7.50, quantity: 8, total_value: 60.00, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)

      visit edit_warehouse_product_path(@warehouse_product)
    end

    xit 'has a form to update an warehouse_product' do

      fill_in 'Product ID:', with: "#{@onions.id}"
      fill_in 'Quantity:', with: "20"
      fill_in 'Warehouse ID:', with: "#{@aurora_warehouse.id}"
      click_button 'Save'

      total_value = @onions.unit_price * 20

      expect(current_path).to eq(warehouse_products_path)
      warehouse_product = WarehouseProduct.last

      # @warehouse_product = updated_item
      expect(warehouse_product.product_id).to eq(@onions.id)
      # expect(@warehouse_product.quantity).to eq(20)
      # expect(@warehouse_product.unit_price).to eq(@onions.unit_price)
      # expect(@warehouse_product.total_value).to eq(total_value)
      # expect(page).to have_content("New WarehouseProduct Has Been Created!")
    end
  end
end
