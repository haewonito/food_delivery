require "rails_helper"

RSpec.describe Inventory, type: :model do
  describe "validations" do
    it { should validate_presence_of :unit_price}
    it { should validate_presence_of :quantity}
    it { should validate_presence_of :total_value}
  end

  describe "relationships" do
    it {should belong_to :product}
    it {should belong_to :warehouse}
  end

  describe "instance methods" do
  end
end
