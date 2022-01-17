require "rails_helper"

RSpec.describe "", type: :feature do
  before(:each) do
    @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
    @tomatoes = Product.create!(name: "Tomatoes", quantity_available: 100, unit_price: 7.50, storage_requirement: "refrigerated")
    @milk = Product.create!(name: "Milk", quantity_available: 100, unit_price: 3.99, storage_requirement: "refrigerated")
    @eggs = Product.create!(name: "Eggs", quantity_available: 100, unit_price: 4.99, storage_requirement: "refrigerated")
    @puff_pastry = Product.create!(name: "Puff Pastry", quantity_available: 100, unit_price: 19.99, storage_requirement: "frozen")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
    @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")
    @fort_collins_warehouse = Warehouse.create!(location_name: "Fort Collins", phone_number: "303-249-2059", address: "305 S College Ave., Fort Collins, CO 80525")

    @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv5 = WarehouseProduct.create!(quantity: 8, product_id: @tomatoes.id, warehouse_id: @fort_collins_warehouse.id)
    @inv6 = WarehouseProduct.create!(quantity: 10, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)
    @inv7 = WarehouseProduct.create!(quantity: 2, product_id: @tomatoes.id, warehouse_id: @aurora_warehouse.id)
      #milk
    @inv8  = WarehouseProduct.create!(quantity: 40, product_id: @milk.id, warehouse_id: @aurora_warehouse.id)
    @inv9  = WarehouseProduct.create!(quantity: 5, product_id: @milk.id, warehouse_id: @fort_collins_warehouse.id)
      #puff_pastry
    @inv10 = WarehouseProduct.create!(quantity: 10, product_id: @puff_pastry.id, warehouse_id: @denver_warehouse.id)
    @inv11 = WarehouseProduct.create!(quantity: 4, product_id: @puff_pastry.id, warehouse_id: @aurora_warehouse.id)

    visit products_path
  end

  it "shows details of each product available" do
    total_value = (@inv10.quantity * @puff_pastry.unit_price).round(2)
    within(".product#{@puff_pastry.id}") do
      expect(page).to have_content("#{@puff_pastry.name}")
      expect(page).to have_content("Quantity Available: #{@puff_pastry.quantity_available}")
      expect(page).to have_content("Unit Price: $#{@puff_pastry.unit_price}")
      expect(page).to have_content("#{@denver_warehouse.location_name}")
      expect(page).to have_content("Quantity: #{@inv10.quantity}")
      expect(page).to have_content("Total Value: $#{total_value}")
    end
  end

  xit "can add product to a warehouse" do
    within(first(".add_button")) do
      fill_in :quantity, with: "555"
      click_button "Add #{@potatoes.name} to #{wh.location_name} Warehouse"
      expect(current_path).to eq("warehouse_products_path")
    end
    expect(page).to have_content("")
  end
end
