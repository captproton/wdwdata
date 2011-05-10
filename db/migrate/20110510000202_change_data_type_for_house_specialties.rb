class ChangeDataTypeForHouseSpecialties < ActiveRecord::Migration
  def self.up
    change_column :eateries, :house_specialties, :text
  end

  def self.down
    change_column :eateries, :house_specialties, :string
  end
end