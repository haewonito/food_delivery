require "rails_helper"

RSpec.describe "welcome page", type: :feature do
  before(:each) do
    visit "/"
  end

  it "I see a link to see the list of inventories" do
    click_on "See All Inventories"
    expect(current_path).to eq(warehouse_products_path)
  end

  it "I see a link to create a new warehouse_product" do
    click_on "Create New WarehouseProduct"
    expect(current_path).to eq(new_warehouse_product_path)
  end

  it " a link to see a list of warehouses" do
    click_on "See All Warehouses"
    expect(current_path).to eq(warehouses_path)
  end

  it "has a link to create a new warehouse " do
    click_on "Create New Warehouse"
    expect(current_path).to eq(new_warehouse_path)
  end
end
