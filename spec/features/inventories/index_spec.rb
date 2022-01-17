require "rails_helper"

RSpec.describe "Inventories Index Page", type: :feature do
  describe "as a visitor" do
    before(:each) do

    @milk = Product.create!(name: "Milk", quantity_available: 100, unit_price: 3.99, storage_requirement: "refrigerated")
    @eggs = Product.create!(name: "Eggs", quantity_available: 100, unit_price: 4.99, storage_requirement: "refrigerated")
    @puff_pastry = Product.create!(name: "Puff Pastry", quantity_available: 100, unit_price: 19.99, storage_requirement: "frozen")
    @shrimp = Product.create!(name: "Shrimp", quantity_available: 100, unit_price: 15.99, storage_requirement: "frozen")
    @linguine = Product.create!(name: "Linguine", quantity_available: 100, unit_price: 18.05, storage_requirement: "non_perishable")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
    @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")
    @fort_collins_warehouse = Warehouse.create!(location_name: "Fort Collins", phone_number: "303-249-2059", address: "305 S College Ave., Fort Collins, CO 80525")

    @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @eggs.id, warehouse_id: @denver_warehouse.id)
    @inv2 = WarehouseProduct.create!(quantity: 10, product_id: @eggs.id, warehouse_id: @aurora_warehouse.id)
    @inv3 = WarehouseProduct.create!(quantity: 10, product_id: @linguine.id, warehouse_id: @denver_warehouse.id)
    @inv4 = WarehouseProduct.create!(quantity: 10, product_id: @linguine.id, warehouse_id: @fort_collins_warehouse.id)
    @inv5 = WarehouseProduct.create!(quantity: 8, product_id: @puff_pastry.id, warehouse_id: @fort_collins_warehouse.id)
    @inv6 = WarehouseProduct.create!(quantity: 10, product_id: @puff_pastry.id, warehouse_id: @denver_warehouse.id)
    @inv7 = WarehouseProduct.create!(quantity: 2, product_id: @puff_pastry.id, warehouse_id: @aurora_warehouse.id)
    @inv8  = WarehouseProduct.create!(quantity: 40, product_id: @milk.id, warehouse_id: @aurora_warehouse.id)
    @inv9  = WarehouseProduct.create!(quantity: 5, product_id: @milk.id, warehouse_id: @fort_collins_warehouse.id)
    @inv10 = WarehouseProduct.create!(quantity: 10, product_id: @shrimp.id, warehouse_id: @denver_warehouse.id)

    visit "/warehouse_products"
    end

    it "I see a list of inventory items with details" do
      within(first('.warehouse_product')) do
        expect(page).to have_content("Product Name: #{@inv1.product.name}")
        expect(page).to have_content("Warehouse: #{@inv1.warehouse.location_name}")
        expect(page).to have_content("Unit Price: $#{@inv1.unit_price}")
        expect(page).to have_content("Quantity: #{@inv1.quantity}")
        expect(page).to have_content("Total Value: $#{@inv1.total_value}")
      end
    end

    it "I see a link to create a new inventory" do
      click_link "Create New Inventory"

      fill_in :product_id, with: "2"
      fill_in :quantity, with: "99"
      fill_in :warehouse_id, with: "2"
      click_button "Save"
    end

    it "for each inventory, I see a button to edit" do
      within(first('.warehouse_product')) do
        click_link "Edit"
        expect(current_path).to eq("/warehouse_products/#{@inv1.id}/edit")
      end
    end

    it "for each inventory, I see a button to delete and it deletes" do

      within(first('.warehouse_product')) do
        click_link "Delete"
        expect(current_path).to eq("/warehouse_products")
      end

      within(first('.warehouse_product')) do
        expect(page).to_not have_content("Warehouse: #{@inv1.warehouse.location_name}")
      end
    end
  end
end
