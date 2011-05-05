class Food < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :menu_items
  has_many :menus, :through => :menu_item
end
