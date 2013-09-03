class AddInventoryTypes < ActiveRecord::Migration
  def up
    InventoryType.create :name => "Desktop"
    InventoryType.create :name => "Notebook"
    InventoryType.create :name => "Monitor"
    InventoryType.create :name => "Server"
    InventoryType.create :name => "Network"
    InventoryType.create :name => "Board"
    InventoryType.create :name => "Other"
  end
end
