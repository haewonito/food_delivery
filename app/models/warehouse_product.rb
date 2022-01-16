class WarehouseProduct < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  # validates_presence_of :quantity
  #
  # def self.search(keyword)
  #   if keyword.scan(/\D/).empty?  #true only if all digits or empty
  #     find(keyword.to_i)
  #   else
  #     WarehouseProduct
  #     .joins
  #     .where("name ILIKE ?", "%#{keyword}%")
  #   end
  # end

  def unit_price
    product.unit_price
  end

  def total_value
    if product.unit_price != nil and quantity != nil
      (product.unit_price * quantity).round(2)
    end
  end

  def product_name
    product.name
  end
end

#instead of total_value put in manually, have a .total_value
#method that can calculate unit_price * quantity?

#also, wonder if I can create warehouse_product without warehouse.
