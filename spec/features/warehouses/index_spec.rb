require "rails_helper"

RSpec.describe "Warehouse Index Page", type: :feature do
  before(:each) do
    @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
    @onions = Product.create!(name: "Onions", quantity_available: 100, unit_price: 12.50, storage_requirement: "rt_perishable")
    @tomatoes = Product.create!(name: "Tomatoes", quantity_available: 100, unit_price: 7.50, storage_requirement: "refrigerated")
    @milk = Product.create!(name: "Milk", quantity_available: 100, unit_price: 3.99, storage_requirement: "refrigerated")
    @eggs = Product.create!(name: "Eggs", quantity_available: 100, unit_price: 4.99, storage_requirement: "refrigerated")
    @puff_pastry = Product.create!(name: "Puff Pastry", quantity_available: 100, unit_price: 19.99, storage_requirement: "frozen")
    @shrimp = Product.create!(name: "Shrimp", quantity_available: 100, unit_price: 15.99, storage_requirement: "frozen")
    @rice = Product.create!(name: "Rice", quantity_available: 100, unit_price: 10.00, storage_requirement: "non_perishable")
    @beans = Product.create!(name: "Beans", quantity_available: 100, unit_price: 10.00, storage_requirement: "non_perishable")
    @linguine = Product.create!(name: "Linguine", quantity_available: 100, unit_price: 18.05, storage_requirement: "non_perishable")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
    @aurora_warehouse = Warehouse.create!(location_name: "Aurora", phone_number: "720-486-2958", address: "357 Lansing Ct, Aurora, CO 39573")
    @fort_collins_warehouse = Warehouse.create!(location_name: "Fort Collins", phone_number: "303-249-2059", address: "305 S College Ave., Fort Collins, CO 80525")

    @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv2 = WarehouseProduct.create!(quantity: 10, product_id: @potatoes.id, warehouse_id: @aurora_warehouse.id)
    @inv3 = WarehouseProduct.create!(quantity: 10, product_id: @onions.id, warehouse_id: @denver_warehouse.id)
    @inv4 = WarehouseProduct.create!(quantity: 10, product_id: @onions.id, warehouse_id: @fort_collins_warehouse.id)
    @inv5 = WarehouseProduct.create!(quantity: 8, product_id: @tomatoes.id, warehouse_id: @fort_collins_warehouse.id)
    @inv6 = WarehouseProduct.create!(quantity: 10, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)
    @inv7 = WarehouseProduct.create!(quantity: 2, product_id: @tomatoes.id, warehouse_id: @aurora_warehouse.id)
    @inv8  = WarehouseProduct.create!(quantity: 40, product_id: @milk.id, warehouse_id: @aurora_warehouse.id)
    @inv9  = WarehouseProduct.create!(quantity: 5, product_id: @milk.id, warehouse_id: @fort_collins_warehouse.id)

    visit warehouses_path
  end

  it "I see a link to create new warehouse" do
    click_link "Create New Warehouse"
    expect(current_path).to eq(new_warehouse_path)
  end

  it "I see a list of warehouse with details" do
    expect(page).to have_css(".warehouse", count: 3)
    within(first('.warehouse')) do
      expect(page).to have_css('.location_name')
      expect(page).to have_css('.phone_number')
      expect(page).to have_css('.address')
    end

    within(first('.warehouse')) do
      expect(page).to have_content("#{@denver_warehouse.location_name} Warehouse:")
      expect(page).to have_content("Phone Number: #{@denver_warehouse.phone_number}")
      expect(page).to have_content("Address: #{@denver_warehouse.address}")
    end
  end

  it "for each warehouse, I see a link to see its show page" do
    within(first('.warehouse')) do
      click_link "Show Page"
      expect(current_path).to eq(warehouse_path(@denver_warehouse.id))
    end

    warehouse_product = @denver_warehouse.warehouse_products.first

    within(".warehouse_product#{warehouse_product.id}") do
      expect(page).to have_content("#{warehouse_product.product.name}")
      expect(page).to have_content("Product ID: #{warehouse_product.product.id}")
      expect(page).to have_content("Unit Price: $#{warehouse_product.product.unit_price}")
      expect(page).to have_content("Quantity: #{warehouse_product.quantity}")
      expect(page).to have_content("Total Value: $#{warehouse_product.total_value}")
    end
  end
end
