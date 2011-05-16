class ChangeFoodDefaultPriceToString < ActiveRecord::Migration
  def self.up
    change_column :foods, :default_price, :string
  end

  def self.down
    change_column :foods, :default_price, :decimal, :precision => 8, :scale => 2
    
  end
end
