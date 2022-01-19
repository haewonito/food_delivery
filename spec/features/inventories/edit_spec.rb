require 'rails_helper'

RSpec.describe 'Inventories Edit Page' do
  describe "as a visitor" do
    before(:each) do
      @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
      @onions = Product.create!(name: "Onions", quantity_available: 100, unit_price: 12.50, storage_requirement: "rt_perishable")

      @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
      @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")

      @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)

      visit "/warehouse_products/#{@inv1.id}/edit"
    end

    it 'has a form to update an warehouse_product' do
      fill_in 'Quantity:', with: "20"
      click_button 'Save'

      total_value = @potatoes.unit_price * 20

      expect(current_path).to eq("/warehouse_products")

      warehouse_product = WarehouseProduct.last

      expect(warehouse_product.product_id).to eq(@potatoes.id)
      expect(warehouse_product.quantity).to eq(20)
      expect(warehouse_product.total_value).to eq(total_value)
    end
  end
end
