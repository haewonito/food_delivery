require "rails_helper"

RSpec.describe Warehouse, type: :model do
  describe "validations" do
    it { should validate_presence_of :location_name}
    it { should validate_presence_of :phone_number}
    it { should validate_presence_of :address}
  end

  describe "relationships" do
    it { should have_many :warehouse_products}
    it { should have_many(:products).through(:warehouse_products) }
  end

  describe "instance methods" do
  end
end
