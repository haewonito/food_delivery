require "rails_helper"

RSpec.describe "welcome page", type: :feature do
  describe "as a visitor" do
    before(:each) do
      visit "/"
    end

    it "has a link to see the list of inventories" do
      click_on "See All Inventories"
      expect(current_path).to eq(inventories_path)
    end

    it "has a link to create a new inventory" do
      click_on "Create New Inventory"
      expect(current_path).to eq(new_inventory_path)
    end
  end
end
