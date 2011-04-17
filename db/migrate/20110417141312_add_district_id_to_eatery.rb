class AddDistrictIdToEatery < ActiveRecord::Migration
  def self.up
    add_column :eateries, :district_id, :integer
  end

  def self.down
    remove_column :eateries, :district_id
  end
end
