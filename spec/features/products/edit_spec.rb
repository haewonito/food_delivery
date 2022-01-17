require 'rails_helper'

RSpec.describe 'Products Edit Page' do
  before(:each) do
    @potatoes = Product.create!(name: "Potatoes", quantity_available: 100, unit_price: 15.65, storage_requirement: "rt_perishable")
    @onions = Product.create!(name: "Onions", quantity_available: 100, unit_price: 12.50, storage_requirement: "rt_perishable")

    visit edit_product_path(@potatoes)
  end

  it 'has a form to update a warehouse' do

    fill_in 'Product Name', with: "Ice Cream"
    fill_in 'Unit Price:', with: "10.99"
    fill_in 'Available Quantity:', with: "500"
    fill_in 'Storage Requirement:', with: "frozen"
    click_button 'Save'

    product = Product.find(@potatoes.id)

    expect(current_path).to eq(products_path)
    expect(product.name).to eq("Ice Cream")
    expect(product.unit_price).to eq(10.99)
    expect(product.quantity_available).to eq(500)
    expect(product.storage_requirement).to eq("frozen")
  end

end
