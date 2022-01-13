class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  validates_presence_of :quantity
  #
  # def self.search(keyword)
  #   if keyword.scan(/\D/).empty?  #true only if all digits or empty
  #     find(keyword.to_i)
  #   else
  #     Inventory
  #     .joins
  #     .where("name ILIKE ?", "%#{keyword}%")
  #   end
  # end
end

#instead of total_value put in manually, have a .total_value
#method that can calculate unit_price * quantity?

#also, wonder if I can create inventory without warehouse.
