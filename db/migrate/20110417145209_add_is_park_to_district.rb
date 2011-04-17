class AddIsParkToDistrict < ActiveRecord::Migration
  def self.up
    add_column :districts, :is_park, :boolean
  end

  def self.down
    remove_column :districts, :is_park
  end
end
