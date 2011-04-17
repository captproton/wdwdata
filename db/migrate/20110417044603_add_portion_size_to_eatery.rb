class AddPortionSizeToEatery < ActiveRecord::Migration
  def self.up
    add_column :eateries, :portion_size, :string
  end

  def self.down
    remove_column :eateries, :portion_size
  end
end
