require "rails_helper"

RSpec.describe "Warehouse Index Page", type: :feature do
  before(:each) do

    @potatoes = Product.create!(name: "Potatoes", unit_price: 15.65, storage_requirement: "rt_perishable")
    @onions = Product.create!(name: "Onions", unit_price: 12.50, storage_requirement: "rt_perishable")
    @tomatoes = Product.create!(name: "Tomatoes", unit_price: 7.50, storage_requirement: "refrigerated")
    @milk = Product.create!(name: "Milk", unit_price: 3.99, storage_requirement: "refrigerated")
    @eggs = Product.create!(name: "Eggs", unit_price: 4.99, storage_requirement: "refrigerated")
    @puff_pastry = Product.create!(name: "Puff Pastry", unit_price: 19.99, storage_requirement: "frozen")
    @shrimp = Product.create!(name: "Shrimp", unit_price: 15.99, storage_requirement: "frozen")
    @rice = Product.create!(name: "Rice", unit_price: 10.00, storage_requirement: "non_perishable")
    @beans = Product.create!(name: "Beans", unit_price: 10.00, storage_requirement: "non_perishable")
    @linguine = Product.create!(name: "Linguine", unit_price: 18.05, storage_requirement: "non_perishable")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
    @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")
    @fort_collins_warehouse = Warehouse.create!(location_name: "Fort Collins", phone_number: "303-249-2059", address: "305 S College Ave., Fort Collins, CO 80525")

    @inv1 = Inventory.create!(unit_price: 15.65, quantity: 2, total_value: 31.3, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv2 = Inventory.create!(unit_price: 15.65, quantity: 10, total_value: 156.50, product_id: @potatoes.id, warehouse_id: @aurora_warehouse.id)
    @inv3 = Inventory.create!(unit_price: 12.50, quantity: 10, total_value: 120.50, product_id: @onions.id, warehouse_id: @denver_warehouse.id)
    @inv4 = Inventory.create!(unit_price: 12.50, quantity: 10, total_value: 120.50, product_id: @onions.id, warehouse_id: @fort_collins_warehouse.id)
    @inv5 = Inventory.create!(unit_price: 7.50, quantity: 8, total_value: 60.00, product_id: @tomatoes.id, warehouse_id: @fort_collins_warehouse.id)
    @inv6 = Inventory.create!(unit_price: 7.50, quantity: 10, total_value: 75.00, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)
    @inv7 = Inventory.create!(unit_price: 7.50, quantity: 2, total_value: 15.00, product_id: @tomatoes.id, warehouse_id: @aurora_warehouse.id)
    @inv8  = Inventory.create!(unit_price: 3.99, quantity: 40, total_value: 159.60, product_id: @milk.id, warehouse_id: @aurora_warehouse.id)
    @inv9  = Inventory.create!(unit_price: 3.99, quantity: 5, total_value: 19.95, product_id: @milk.id, warehouse_id: @fort_collins_warehouse.id)

    visit warehouses_path
  end

  it "I see a list of warehouse with details" do
    expect(page).to have_css(".warehouse", count: 3)

    within(first('.warehouse')) do
      expect(page).to have_css('.location_name')
      expect(page).to have_css('.phone_number')
      expect(page).to have_css('.address')
    end

    within(first('.warehouse')) do
      expect(page).to have_content("Location Name: #{@denver_warehouse.location_name}")
      expect(page).to have_content("Phone Number: #{@denver_warehouse.phone_number}")
      expect(page).to have_content("Address: #{@denver_warehouse.address}")
    end
  end

  it "for each warehouse, I see a link to see its inventories" do
    within(first('.warehouse')) do
      click_link "List of Inventories"
      expect(current_path).to eq(warehouse_path(@denver_warehouse.id))
    end

    inventory = @denver_warehouse.inventories.first

    within(first('.inventory')) do
      expect(page).to have_content("Inventory ID: #{inventory.id}")
      expect(page).to have_content("Product ID: #{inventory.product.id}")
      expect(page).to have_content("Product Name: #{inventory.product.name}")
      expect(page).to have_content("Unit Price: $#{inventory.unit_price}")
      expect(page).to have_content("Quantity: #{inventory.quantity}")
      expect(page).to have_content("Total Value: $#{inventory.total_value}")
    end
  end

  xit "for each warehouse, I see a button to edit" do
    within(first('.warehouse')) do
      click_link "Edit"
      expect(current_path).to eq(edit_warehouse_path(@inv1.id))
    end
  end

  xit "for each inventory, I see a button to delete and it deletes" do
    within(first('.inventory')) do
      click_link "Delete"
      expect(current_path).to eq(inventories_path)
    end
    expect(page).to_not have_content("Inventory ID: #{@inv1.id}")
  end
end
