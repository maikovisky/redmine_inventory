class InventoryType < ActiveRecord::Base
  has_many :inventories
  validates :name, :presence=>true
end
