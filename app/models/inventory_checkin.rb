class InventoryCheckin < ActiveRecord::Base
  belongs_to :inventory 
  belongs_to :user
  belongs_to :locate
end
