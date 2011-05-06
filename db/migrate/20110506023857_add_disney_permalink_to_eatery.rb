class AddDisneyPermalinkToEatery < ActiveRecord::Migration
  def self.up
    add_column :eateries, :disney_permalink, :string
  end

  def self.down
    remove_column :eateries, :disney_permalink
  end
end
