require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity_available }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :storage_requirement }
  end

  describe "relationships" do
    it { should have_many :warehouse_products}
    it { should have_many(:warehouses).through(:warehouse_products) }
  end
end
