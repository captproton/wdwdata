class CreateEateries < ActiveRecord::Migration
  def self.up
    create_table :eateries do |t|
      t.string :name
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :eateries
  end
end
