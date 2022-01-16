class Warehouse < ApplicationRecord
  has_many :warehouse_products
  has_many :products, through: :warehouse_products

  validates_presence_of :location_name
  validates_presence_of :phone_number
  validates_presence_of :address
end
