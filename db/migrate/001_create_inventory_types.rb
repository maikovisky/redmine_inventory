class CreateInventoryTypes < ActiveRecord::Migration
  def change
    create_table :inventory_types do |t|
      t.string :name
    end
  end

  def down
	drop_table :inventory_types
  end
end
