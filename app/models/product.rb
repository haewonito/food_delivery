class Product < ApplicationRecord
  has_many :inventories

  validates_presence_of :name
  validates_presence_of :unit_price
  validates_presence_of :storage_requirement
  # validates_presence_of
end
