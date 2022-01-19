require "rails_helper"

RSpec.describe "Warehouse Show Page", type: :feature do
  before(:each) do
    @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
    @onions = Product.create!(name: "Onions", quantity_available: 100, unit_price: 12.50, storage_requirement: "rt_perishable")
    @tomatoes = Product.create!(name: "Tomatoes", quantity_available: 100, unit_price: 7.50, storage_requirement: "refrigerated")
    @linguine = Product.create!(name: "Linguine", quantity_available: 100, unit_price: 18.05, storage_requirement: "non_perishable")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")

    @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv3 = WarehouseProduct.create!(quantity: 10, product_id: @onions.id, warehouse_id: @denver_warehouse.id)
    @inv6 = WarehouseProduct.create!(quantity: 10, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)

    visit warehouse_path(@denver_warehouse.id)
  end

  it "shows the warehouses's phone number and address" do
    expect(page).to have_content("#{@denver_warehouse.phone_number}")
    expect(page).to have_content("#{@denver_warehouse.address}")
  end

  it "shows the list of products available and their details" do
    warehouse_product = @denver_warehouse.warehouse_products.first

    within(".warehouse_product#{warehouse_product.id}") do
      expect(page).to have_content("Product ID: #{warehouse_product.product.id}")
      expect(page).to have_content("#{warehouse_product.product.name}")
      expect(page).to have_content("Unit Price: $#{warehouse_product.unit_price}")
      expect(page).to have_content("Quantity: #{warehouse_product.quantity}")
      expect(page).to have_content("Total Value: $#{warehouse_product.total_value}")
    end
  end

  it "I see a button to edit warehouse" do
    click_link "Edit #{@denver_warehouse.location_name} Warehouse"
    expect(current_path).to eq(edit_warehouse_path(@denver_warehouse.id))
  end
end
