class CreateInventoryTypes < ActiveRecord::Migration
  def change
    create_table :inventory_types do |t|
      t.string :name
    end
  end
end
