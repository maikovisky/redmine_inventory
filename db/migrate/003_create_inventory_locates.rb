class CreateInventoryLocates < ActiveRecord::Migration
  def change
    create_table :inventory_locates do |t|
      t.string :name
      t.string :address
      t.string :city
    end
  end

  def down
    drop_table :inventory_locates
  end
end
