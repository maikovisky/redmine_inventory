class Inventory < ActiveRecord::Base
  belongs_to :inventory_type
  belongs_to :inventory_brand
  has_many :inventory_checkins
  validates :name, :presence=> true, :length =>{ :minimum=> 3}
  validates :serial, :model, :presence=> true
  validates :inventoryid, :presence => true
end
