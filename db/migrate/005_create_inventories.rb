class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :serial
      t.string :inventoryid
      t.string :model
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :consumption
      t.text :comment
      t.boolean :outofservice, :null => false, :default => false
      t.belongs_to :inventory_type
      t.belongs_to :inventory_brand
    end
  end
end
