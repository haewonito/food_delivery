require 'rails_helper'

RSpec.describe 'Product Create Page' do
  before(:each) do
    visit new_product_path
  end

  it 'has a form to create a new product' do

    fill_in 'Product Name', with: "Ice Cream"
    fill_in 'Unit Price:', with: "10.99"
    fill_in 'Available Quantity:', with: "500"
    fill_in 'Storage Requirement:', with: "frozen"
    click_button 'Save'

    product = Product.last

    expect(current_path).to eq(products_path)
    expect(product.name).to eq("Ice Cream")
    expect(product.unit_price).to eq(10.99)
    expect(product.quantity_available).to eq(500)
    expect(product.storage_requirement).to eq("frozen")
  end

  it 'gives error messge if a new product fails to create' do

    fill_in 'Name:', with: "Spinach"
    click_button 'Save'

    expect(current_path).to eq(new_product_path)
    expect(page).to have_content("Product is not created:")
  end
end
