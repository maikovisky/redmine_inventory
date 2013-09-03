class InventoryCheckin < ActiveRecord::Base
  belongs_to :inventory 
  belongs_to :user
end
