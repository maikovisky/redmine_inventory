class Inventory < ActiveRecord::Base
  belongs_to :inventory_type
  belongs_to :inventory_brand
  has_many :inventory_checkins
end
