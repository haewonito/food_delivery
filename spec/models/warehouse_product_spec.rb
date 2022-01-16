require "rails_helper"

RSpec.describe WarehouseProduct, type: :model do
  describe "validations" do
    it { should validate_presence_of :quantity}
  end

  describe "relationships" do
    it { should belong_to :product }
    it { should belong_to :warehouse }
  end

  describe "instance methods" do
  end
end
