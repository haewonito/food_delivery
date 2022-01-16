require "rails_helper"

RSpec.describe "", type: :feature do
  before(:each) do
    @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")
    @inv1 = WarehouseProduct.create!(quantity: 2, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
  end

  it "shows quantity available" do
    visit products_path

    expect(page).to have_content("Quantity Available: 100")
  end

  it "can add product to a warehouse" do
    visit products_path
    within(first(".add_button")) do
      click_button "Add #{@potatoes.name} to #{wh.location_name} Warehouse"
      expect(current_path).to eq("/warehouses/#{@denver_warehouse.id}/products/#{@potatoes.id}/edit")
    end
    expect(page).to have_content("")
  end
end
