class CreateInventoryCheckins < ActiveRecord::Migration
  def change
    create_table :inventory_checkins do |t|
      t.datetime :create_at
      t.datetime :update_at
      t.text :comment
      t.belongs_to :inventory
      t.belongs_to :inventory_locate
      t.belongs_to :user
    end
  end

  def down
    drop_table :inventory_checkins
  end
end
