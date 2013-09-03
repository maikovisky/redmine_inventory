class CreateInventoryBrands < ActiveRecord::Migration
  def change
    create_table :inventory_brands do |t|
      t.string :name
    end
  end
end
