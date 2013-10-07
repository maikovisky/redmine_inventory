class CreateInventoryBrands < ActiveRecord::Migration
  def change
    create_table :inventory_brands do |t|
      t.string :name
    end
  end

  def down
     drop_table :inventory_brands
  end
end
