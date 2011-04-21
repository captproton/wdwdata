class AddCreditToDistrict < ActiveRecord::Migration
  def self.up
    add_column :districts, :credit, :string
  end

  def self.down
    remove_column :districts, :credit
  end
end
