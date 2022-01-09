class Warehouse < ApplicationRecord
  has_many :inventories

  validates_presence_of :location_name
  validates_presence_of :phone_number
  validates_presence_of :address
end
