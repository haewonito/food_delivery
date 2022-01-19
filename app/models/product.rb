class Product < ApplicationRecord
  has_many :warehouse_products, dependent: :destroy
  has_many :warehouses, through: :warehouse_products, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :quantity_available
  validates_presence_of :unit_price
  validates_presence_of :storage_requirement
end
