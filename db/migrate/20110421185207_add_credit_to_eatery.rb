class AddCreditToEatery < ActiveRecord::Migration
  def self.up
    add_column :eateries, :credit, :string
  end

  def self.down
    remove_column :eateries, :credit
  end
end
