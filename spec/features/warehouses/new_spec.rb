require 'rails_helper'

RSpec.describe 'Warehouse Create Page' do
  before(:each) do
    visit new_warehouse_path
  end

  it 'has a form to create a new house' do

    fill_in 'Location Name:', with: "Colorado Springs"
    fill_in 'Phone Number:', with: "111-111-1111"
    fill_in 'Address:', with: "3434 Colorado Ave, Colorado Springs, CO 80282"
    click_button 'Save'

    warehouse = Warehouse.last

    expect(current_path).to eq(warehouses_path)
    expect(warehouse.location_name).to eq("Colorado Springs")
    expect(warehouse.phone_number).to eq("111-111-1111")
    expect(warehouse.address).to eq("3434 Colorado Ave, Colorado Springs, CO 80282")
    # expect(page).to have_content("New Inventory Has Been Created!")
  end
end
