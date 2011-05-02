class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :menu_item_id
      t.decimal :default_price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
