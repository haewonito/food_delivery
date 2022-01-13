require 'rails_helper'

RSpec.describe 'Warehouse Edit Page' do
  before(:each) do

    @potatoes = Product.create!(name: "Potatoes", unit_price: 15.65, storage_requirement: "rt_perishable")
    @onions = Product.create!(name: "Onions", unit_price: 12.50, storage_requirement: "rt_perishable")
    @tomatoes = Product.create!(name: "Tomatoes", unit_price: 7.50, storage_requirement: "refrigerated")

    @denver_warehouse = Warehouse.create!(location_name: "Denver", phone_number: "395-394-3958", address: "4051 Honker St., Denver, CO 80202")

    @inv1 = Inventory.create!(unit_price: 15.65, quantity: 2, total_value: 31.3, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv2 = Inventory.create!(unit_price: 15.65, quantity: 10, total_value: 156.50, product_id: @potatoes.id, warehouse_id: @denver_warehouse.id)
    @inv3 = Inventory.create!(unit_price: 12.50, quantity: 10, total_value: 120.50, product_id: @onions.id, warehouse_id: @denver_warehouse.id)
    @inv7 = Inventory.create!(unit_price: 7.50, quantity: 2, total_value: 15.00, product_id: @tomatoes.id, warehouse_id: @denver_warehouse.id)

    visit edit_warehouse_path(@denver_warehouse)
  end

  it 'has a form to update a warehouse' do

    fill_in 'Location Name:', with: "Colorado Springs"
    fill_in 'Phone Number:', with: "111-111-1111"
    fill_in 'Address:', with: "3434 Colorado Ave, Colorado Springs, CO 80282"
    click_button 'Save'

    warehouse = Warehouse.find(@denver_warehouse.id)

    expect(current_path).to eq(warehouses_path)
    expect(warehouse.location_name).to eq("Colorado Springs")
    expect(warehouse.phone_number).to eq("111-111-1111")
    expect(warehouse.address).to eq("3434 Colorado Ave, Colorado Springs, CO 80282")
  end

end
