class Menu < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :eatery
  has_many :menu_items
  has_many :foods, :through => :menu_item
end
