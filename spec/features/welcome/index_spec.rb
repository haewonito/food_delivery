require "rails_helper"

RSpec.describe "welcome page", type: :feature do
  before(:each) do
    visit "/"
  end

  it "I see a link to inventories index page" do
    click_on "See All Inventories"
    expect(current_path).to eq("/warehouse_products")
  end

  it "I see a link to products index page" do
    click_on "See All Products"
    expect(current_path).to eq(products_path)
  end

  it "I see a link to warehouses index page" do
    click_on "See All Warehouses"
    expect(current_path).to eq(warehouses_path)
  end
end
